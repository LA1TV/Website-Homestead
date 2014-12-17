#!/usr/bin/env bash
echo "Creating storage directories..."
cd "/home/vagrant/Code/LA1-Website"
mkdir app/storage
mkdir app/storage/cache
mkdir app/storage/files
mkdir app/storage/file_chunks
mkdir app/storage/logs
mkdir app/storage/meta
mkdir app/storage/sessions
mkdir app/storage/views
echo "Created storage directories."