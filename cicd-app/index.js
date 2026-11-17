
const http = require("node:http");

const PORT = process.env.PORT || 3000;

const { after } = require("node:test");

after(() => {
  server.close();
});

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "application/json");

  if (req.url === "/" && req.method === "GET") {
    res.writeHead(200);
    res.end(JSON.stringify({
      application: "AWS CI/CD Portfolio API",
      version: "1.0.0",
      message: "Application is running successfully"
    }));
    return;
  }

  if (req.url === "/health" && req.method === "GET") {
    res.writeHead(200);
    res.end(JSON.stringify({
      status: "healthy",
      service: "cicd-app"
    }));
    return;
  }

  res.writeHead(404);
  res.end(JSON.stringify({
    error: "Route not found"
  }));
});

// if (require.main === module) {
//   server.listen(PORT, () => {
//     console.log(`Server running on port ${PORT}`);
//   });
// }

// module.exports = server;

if (require.main === module) {
  server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
} else {
  server.listen(0);
}

module.exports = server;
