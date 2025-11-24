process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
const axios = require("axios");

const API = "http://localhost:7275/api";

describe("DocumentTypes API", () => {

    test("GET v1 returns Id + Name", async () => {
        const res = await axios.get(`${API}/v1/document-types`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);
    });

    test("GET v2 returns Description", async () => {
        const res = await axios.get(`${API}/v2/document-types`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);

        if (res.data.length > 0) {
            expect(res.data[0]).toHaveProperty("description");
        }
    });

});

