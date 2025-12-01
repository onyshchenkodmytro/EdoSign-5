const { spawn } = require("child_process");
const axios = require("axios");
const path = require("path");

const providers = ["InMemory", "Sqlite", "Postgres", "SqlServer"];
const API = "http://localhost:7275/api";

// ------------------------------------------
// WAIT UNTIL API IS UP
// ------------------------------------------
async function waitForApi() {
    const maxAttempts = 80;

    for (let i = 0; i < maxAttempts; i++) {
        try {
            await axios.get(API + "/v1/Clients");
            return;
        } catch {
            await new Promise(r => setTimeout(r, 200));
        }
    }

    throw new Error("API did not start in time");
}

// ------------------------------------------
// START API PROCESS (silent mode)
// ------------------------------------------
function startApi(provider) {
    console.log(`\n--- Starting API with ${provider} ---`);

    const proc = spawn(
        "dotnet",
        ["run", "--urls", "http://localhost:7275"],
        {
            cwd: path.join(__dirname, ".."),
            env: {
                ...process.env,
                ASPNETCORE_ENVIRONMENT: "Test",
                DatabaseOptions__Provider: provider
            },
            shell: true
        }
    );

    // ❗ Логи вимкнені
    proc.stdout.on("data", () => { });
    proc.stderr.on("data", () => { });

    return proc;
}

// ------------------------------------------
// MAIN TEST LOOP
// ------------------------------------------
describe("RUN TESTS FOR ALL DATABASES", () => {

    for (const provider of providers) {

        describe(`Database = ${provider}`, () => {

            let apiProcess;

            beforeAll(async () => {
                apiProcess = startApi(provider);
                await waitForApi();
            }, 90000);

            afterAll(() => {
                if (apiProcess) apiProcess.kill("SIGINT");
            });

            // --------- TESTS ---------
            test("Clients v1", async () => {
                const res = await axios.get(`${API}/v1/Clients`);
                expect(res.status).toBe(200);
            });

            test("Clients v2", async () => {
                const res = await axios.get(`${API}/v2/Clients`);
                expect(res.status).toBe(200);
            });

            test("Document Types v1", async () => {
                const res = await axios.get(`${API}/v1/document-types`);
                expect(res.status).toBe(200);
            });

            test("Document Types v2", async () => {
                const res = await axios.get(`${API}/v2/document-types`);
                expect(res.status).toBe(200);
            });

            test("Signed Docs v1", async () => {
                const res = await axios.get(`${API}/v1/signed-documents`);
                expect(res.status).toBe(200);
            });

            test("Signed Docs v2", async () => {
                const res = await axios.get(`${API}/v2/signed-documents`);
                expect(res.status).toBe(200);
            });

        });

    }

});