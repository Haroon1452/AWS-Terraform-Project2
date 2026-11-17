
const { test, after } = require("node:test");
const assert = require("node:assert/strict");
const server = require("../index");

after(() => {
  server.close();
});

test("GET / returns application information", async () => {
  const response = await fetch(
    `http://127.0.0.1:${server.address().port}/`
  );

  assert.equal(response.status, 200);

  const data = await response.json();
  assert.equal(data.application, "AWS CI/CD Portfolio API");
  assert.equal(data.version, "1.0.0");
});

test("GET /health returns healthy status", async () => {
  const response = await fetch(
    `http://127.0.0.1:${server.address().port}/health`
  );

  assert.equal(response.status, 200);

  const data = await response.json();
  assert.equal(data.status, "healthy");
  assert.equal(data.service, "cicd-app");
});

test("Unknown routes return 404", async () => {
  const response = await fetch(
    `http://127.0.0.1:${server.address().port}/unknown`
  );

  assert.equal(response.status, 404);
});
