// Small wrapper of Socket.io for GM:S 2
class SocketIO {

    constructor() {
        this.socket = null;
    }

    connect() {
        this.socket = io.connect();
        this.init_socket_event();
    }

    connect_by_url(url) {
        this.socket = io.connect(url);
        this.init_socket_event();
    }

    disconnect() {
        this.socket.close();
    }

    reconnect() {
        this.socket.open();
    }

    init_socket_event() {
        this.socket.on('connect', () => {
            gml_Script_gmcallback_sio_on_connect();
        });

        this.socket.on('disconnect', () => {
            gml_Script_gmcallback_sio_on_disconnect();
        });
    }

    add_event(name) {
        this.socket.on(name, (data) => {
            if (typeof data === 'object')
                data = JSON.stringify(data);

            window[`gml_Script_gmcallback_sio_on_${name}`](-1, -1, data);
        });
    }

    send(name, data) {
        this.socket.emit(name, data);
    }

    get_connection_status() {
        return this.socket.connected;
    }
}

// API for GM:S 2
const socketio = new SocketIO();

function sio_connect() {
    socketio.connect();
}

function sio_connect_by_url(url) {
    socketio.connect_by_url(url);
}

function sio_disconnect() {
    socketio.disconnect();
}

function sio_reconnect() {
    socketio.reconnect();
}

function sio_addEvent(name) {
    socketio.add_event(name);
}

function sio_emit(name, data) {
    socketio.send(name, data);
}

function sio_get_connection_status() {
    return socketio.get_connection_status();
}
