#!/usr/bin/env bash

usage() {
  cat << EOF

Usage: ./$(basename "${0}") [OPTIONS]

DESCRIPTION:
Update all docker compose services in the path

OPTIONS:
-p, --path PATH
EOF
}

if [[ $# -eq 0 ]]; then
  echo "No option provided."
  usage
  exit 1
fi

# Gather options
while [[ ! $# -eq 0 ]]; do
  case "${1}" in
    -h | --help)
      usage
      exit 0
      ;;

    -p | --path)
      if [[ -z "${2-}" ]]; then
        usage
        exit 1
      fi
      shift
      # shellcheck disable=SC2034
      DOCKERS_PATH="${1}"
      ;;

    *)
      echo "Invalid option: ${1}"
      usage
      exit 1
      ;;
  esac
  shift
done


DOCKER_DIRS="$(dirname $(find "${DOCKERS_PATH}" -name '*compose*'))"

for dir in $DOCKER_DIRS; do
  pushd "${dir}" || exit 1

  docker compose pull && docker compose up -d

  popd || exit 1
done

docker image prune --force
