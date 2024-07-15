# First stage: Build the Go application
FROM golang:1.22.5-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go modules manifests
COPY go.mod go.sum ./

# Download the Go modules dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o kirito .

# Second stage: Create a lightweight image
FROM alpine:latest

# Install the necessary package to run the binary
RUN apk --no-cache add ca-certificates

# Set the working directory inside the container
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/kirito .

# Expose port 8080
EXPOSE 8080

# Command to run the binary
CMD ["./kirito"]
