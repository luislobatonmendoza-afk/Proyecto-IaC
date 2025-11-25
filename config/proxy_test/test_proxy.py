def test_nginx_is_installed(host):
    nginx_package = host.package("nginx")
    assert nginx_package.is_installed

def test_nginx_service_is_running(host):
    # Verifica que el servicio Nginx esté activo
    nginx_service = host.service("nginx")
    assert nginx_service.is_running
    assert nginx_service.is_enabled

def test_nginx_listening_port(host):
    # Verifica que Nginx esté escuchando en el puerto 80
    socket = host.socket("tcp://0.0.0.0:80")
    assert socket.is_listening
