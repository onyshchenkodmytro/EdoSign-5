process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
const axios = require("axios");

const API = "http://localhost:7275/api";

describe("Clients API tests", () => {

    test("GET v1 clients returns list of clients", async () => {
        const res = await axios.get(`${API}/v1/Clients`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);

        if (res.data.length > 0) {
            expect(res.data[0]).toHaveProperty("id");
            expect(res.data[0]).toHaveProperty("name");
        }
    });

    test("GET v2 clients returns list with email", async () => {
        const res = await axios.get(`${API}/v2/Clients`);

        expect(res.status).toBe(200);
        expect(Array.isArray(res.data)).toBe(true);

        if (res.data.length > 0) {
            expect(res.data[0]).toHaveProperty("email");
        }
    });

});

