#!/bin/bash

if [ ! -d "my-app" ]; then
  echo "Creating Vite app..."
  npm create vite@latest my-app --template react-ts
else
  echo "Vite app already exists."
fi

# Navigate to the app directory
cd my-app
echo "Installing dependencies..."
npm install