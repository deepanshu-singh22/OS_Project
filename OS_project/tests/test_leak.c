#include <stdlib.h>

struct Buffer {
    int* data_array;
};

struct IO_Request {
    struct Buffer* internal_buf;
};

struct IO_Request* create_request(int size) {
    struct IO_Request* req = (struct IO_Request*)malloc(sizeof(struct IO_Request));
    req->internal_buf = (struct Buffer*)malloc(sizeof(struct Buffer));
    req->internal_buf->data_array = (int*)malloc(size * sizeof(int));
    return req;
}

void process_and_cleanup(struct IO_Request* req) {
    // BUG: Missing free for internal_buf and data_array
    free(req); 
}

int main() {
    struct IO_Request* my_req = create_request(1024);
    process_and_cleanup(my_req);
    return 0;
}
