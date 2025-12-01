using System;
using System.Diagnostics;
using System.Security.Cryptography;
using EdoSign.Lab_3.Models.Entities;
using EdoSign.Lab_3.Models.Orm;
using EdoSign.Lab_3.Telemetry;

namespace EdoSign.Lab_3.Services
{
    public class CryptoService
    {
        // === 1. Генерація RSA-пари ключів ===
        public (string privatePem, string publicPem) GenerateRsaKeyPair()
        {
            using var activity = TelemetrySources.LongOps.StartActivity("GenerateRsaKeyPair");

            activity?.SetTag("operation.type", "rsa-generate");
            activity?.SetTag("key.size", 2048);

            using var rsa = RSA.Create(2048);

            var privateKey = ExportPrivateKeyPem(rsa);
            var publicKey = ExportPublicKeyPem(rsa);

            activity?.SetTag("privateKey.length", privateKey.Length);
            activity?.SetTag("publicKey.length", publicKey.Length);

            return (privateKey, publicKey);
        }

        // === 2. Підписування даних ===
        public string SignToBase64(byte[] data, string privateKeyPem)
        {
            using var activity = TelemetrySources.LongOps.StartActivity("SignData");

            activity?.SetTag("operation.type", "sign");
            activity?.SetTag("data.size", data.Length);
            activity?.SetTag("key.type", "private");
            activity?.SetTag("algorithm", "RSA-SHA256");

            using var rsa = RSA.Create();
            rsa.ImportFromPem(privateKeyPem.ToCharArray());

            var signature = rsa.SignData(data, HashAlgorithmName.SHA256, RSASignaturePadding.Pkcs1);
            var base64 = Convert.ToBase64String(signature);

            activity?.SetTag("signature.size", base64.Length);

            return base64;
        }

        // === 3. Перевірка підпису ===
        public bool VerifySignature(byte[] data, string signatureBase64, string publicKeyPem)
        {
            using var activity = TelemetrySources.LongOps.StartActivity("VerifySignature");

            activity?.SetTag("operation.type", "verify");
            activity?.SetTag("data.size", data.Length);
            activity?.SetTag("signature.size", signatureBase64.Length);
            activity?.SetTag("key.type", "public");
            activity?.SetTag("algorithm", "RSA-SHA256");

            using var rsa = RSA.Create();
            rsa.ImportFromPem(publicKeyPem.ToCharArray());

            var signature = Convert.FromBase64String(signatureBase64);
            var result = rsa.VerifyData(data, signature, HashAlgorithmName.SHA256, RSASignaturePadding.Pkcs1);

            activity?.SetTag("verify.result", result);

            return result;
        }

        // === 4. Довга операція: масова валідація ===
        public async Task ValidateManySignaturesAsync(List<SignedDocument> docs)
        {
            using var activity = TelemetrySources.LongOps.StartActivity("MassSignatureValidation");

            activity?.SetTag("operation.type", "mass-validation");
            activity?.SetTag("items.count", docs.Count);

            foreach (var doc in docs)
            {
                Activity.Current?.SetTag("document.id", doc.Id);
                Activity.Current?.SetTag("document.name", doc.FileName);

                // Симуляція довгої роботи (3 сек total)
                await Task.Delay(100);
            }
        }

        // === Допоміжні методи для експорту PEM ===
        private string ExportPrivateKeyPem(RSA rsa)
        {
            using var activity = TelemetrySources.LongOps.StartActivity("ExportPrivateKeyPem");
            activity?.SetTag("key.export", "private");

            var privateKeyBytes = rsa.ExportPkcs8PrivateKey();
            var b64 = Convert.ToBase64String(privateKeyBytes, Base64FormattingOptions.InsertLineBreaks);

            activity?.SetTag("pem.length", b64.Length);

            return $"-----BEGIN PRIVATE KEY-----\n{b64}\n-----END PRIVATE KEY-----";
        }

        private string ExportPublicKeyPem(RSA rsa)
        {
            using var activity = TelemetrySources.LongOps.StartActivity("ExportPublicKeyPem");
            activity?.SetTag("key.export", "public");

            var publicKeyBytes = rsa.ExportSubjectPublicKeyInfo();
            var b64 = Convert.ToBase64String(publicKeyBytes, Base64FormattingOptions.InsertLineBreaks);

            activity?.SetTag("pem.length", b64.Length);

            return $"-----BEGIN PUBLIC KEY-----\n{b64}\n-----END PUBLIC KEY-----";
        }
    }
}
