import pytest

def test_docker_is_installed(host):
    docker_package = host.package("docker.io")
    assert docker_package.is_installed

def test_frontend_container_is_running(host):
    container = host.docker("webapp")
    assert container.is_running

def test_frontend_listening_port(host):
    socket = host.socket("tcp://0.0.0.0:8080")
    assert socket.is_listening
