const { spawn } = require("child_process");
const axios = require("axios");
const path = require("path");

let apiProcess = null;

async function waitForApi() {
    for (let i = 0; i < 80; i++) {
        try {
            await axios.get("http://localhost:7275");
            return;
        } catch {
            await new Promise(r => setTimeout(r, 250));
        }
    }
    throw new Error("API did not start in time");
}

function startApi(env) {
    return new Promise(async (resolve, reject) => {

        console.log("💥 startApi CALLED, ENV =", env);

        const apiPath = path.join(__dirname, "..");   // піднімаємось з ApiTests в EdoSign.Lab-3
        console.log("API PATH:", apiPath);

        apiProcess = spawn("dotnet", ["run"], {
            cwd: apiPath,
            env: {
                ...process.env,
                ASPNETCORE_ENVIRONMENT: env
            }
        });

        apiProcess.stdout.on("data", data => {
            console.log("[API]", data.toString());
        });

        apiProcess.stderr.on("data", data => {
            console.error("[API ERR]", data.toString());
        });

        apiProcess.on("error", err => {
            console.error("❌ Failed to start API:", err);
            reject(err);
        });

        await waitForApi();
        console.log("✔ API STARTED WITH ENV:", env);
        resolve();
    });
}

function stopApi() {
    if (apiProcess) {
        apiProcess.kill();
        apiProcess = null;
    }
}

module.exports = { startApi, stopApi };
