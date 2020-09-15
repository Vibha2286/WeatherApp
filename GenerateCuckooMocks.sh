#!/usr/bin/env bash
# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="$PROJECT_DIR/WeatherAppTests/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "$PROJECT_DIR" to your project's root source folder, if it's not the default name.
INPUT_DIR="$PROJECT_DIR"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
# Please add "$INPUT_DIR/$(find . -name SWIFTFILENAME.swift) below to be mocked out
${PODS_ROOT}/Cuckoo/run generate --testable "WeatherApp" \
--output "${OUTPUT_FILE}" \
 "$INPUT_DIR/$(find . -name WeatherView.swift)" \
 "$INPUT_DIR/$(find . -name WeatherDetailsView.swift)" \
 "$INPUT_DIR/$(find . -name MapView.swift)"
 
 
 
 



