#!/bin/bash
set -eo pipefail

circleci orb publish angular/orb.yml okode/angular@dev:first
circleci orb publish stack/orb.yml okode/stack@dev:first