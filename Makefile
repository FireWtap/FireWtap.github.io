# Makefile for francesco-massafra-website

.PHONY: help install demo telecomsteve clean deploy-demo

# Default target
help:
	@echo "Available commands:"
	@echo "  make install       - Install dependencies (pnpm)"
	@echo "  make demo          - Run local development server"
	@echo "  make telecomsteve  - Serve archived telecomsteve example site"
	@echo "  make clean         - Clean any temporary files"
	@echo "  make deploy-demo   - Deploy to demo environment (requires GCP credentials)"

# Install dependencies
install:
	@echo "Installing dependencies..."
	pnpm install

# Run local development server
demo:
	@echo "Starting local server on http://localhost:8080"
	pnpm dlx http-server -p 8080 -o

# Serve the archived telecomsteve example site
telecomsteve:
	@echo "Starting telecomsteve example site on http://localhost:8081"
	pnpm dlx http-server examples/telecomsteve -p 8081 -o

# Clean any temporary files
clean:
	@echo "Cleaning temporary files..."
	find . -name '*DS_Store*' -type f -delete
	find . -name '*.log' -type f -delete

# Deploy to demo environment (Google Cloud Storage)
deploy-demo:
	@echo "Deploying to demo environment..."
	gcloud storage cp 404.html gs://demo.telecomsteve.com/
	gcloud storage cp index.html gs://demo.telecomsteve.com/
	gcloud storage cp cv.pdf gs://demo.telecomsteve.com/
	gcloud storage cp -r css gs://demo.telecomsteve.com/
	gcloud storage cp -r img gs://demo.telecomsteve.com/
	gcloud storage cp LICENSE gs://demo.telecomsteve.com/
	gcloud storage cp README.md gs://demo.telecomsteve.com/
	gcloud storage buckets update gs://demo.telecomsteve.com --web-main-page-suffix=index.html --web-error-page=404.html
	@echo "Demo deployment complete: https://demo.telecomsteve.com"
