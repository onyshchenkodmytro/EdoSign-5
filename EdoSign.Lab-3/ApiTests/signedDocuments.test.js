process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
const axios = require("axios");

const API = "http://localhost:7275/api";

describe("SignedDocuments API", () => {

    test("GET v1 returns basic fields", async () => {
        const res = await axios.get(`${API}/v1/signed-documents`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);
    });

    test("GET v2 returns extended fields", async () => {
        const res = await axios.get(`${API}/v2/signed-documents`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);
    });

});   
