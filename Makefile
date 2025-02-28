# Define Variables
PROJECT = scientific_calculator
DOCKER_IMAGE = ajop232/scientific

# Default Target
all: test build docker_run

# Run Tests using BATS
test:
	bats test_calculator.bats

# Build the Calculator (Shell Script)
build:
	chmod +x calculator.sh

# Create Docker Image
docker_build:
	docker build -t $(DOCKER_IMAGE) .

# Run Docker Container
docker_run:
	docker run -it --rm $(DOCKER_IMAGE)

# Clean Up
clean:
	rm -f *.o
