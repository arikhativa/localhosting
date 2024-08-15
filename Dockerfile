# Use the official Go image as the base image
FROM golang:alpine AS builder

# Set the current working directory inside the container
WORKDIR /app

# Copy the Go source code into the container
COPY src/* .

# Build the Go application
RUN go build -o main .

FROM alpine:3.20.2

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8080

# Run the Go application
CMD ["./main"]
