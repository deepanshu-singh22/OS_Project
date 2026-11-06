#include <stdlib.h>

// Level 2: OS Network Packet Payload
struct PacketData {
    char* payload;
};

// Level 1: OS Network Driver Transmission Request
struct NetDriverRequest {
    int tx_id;
    struct PacketData* data_ptr;
};

// Simulated Kernel Allocation
struct NetDriverRequest* alloc_tx_request(int size) {
    struct NetDriverRequest* req = (struct NetDriverRequest*)malloc(sizeof(struct NetDriverRequest));
    req->data_ptr = (struct PacketData*)malloc(sizeof(struct PacketData));
    req->data_ptr->payload = (char*)malloc(size); // Deepest OS allocation
    return req;
}

// Simulated Kernel Deallocation
void drop_packet(struct NetDriverRequest* req) {
    // OS BUG: Dropping network packet but leaking inner payload!
    free(req); 
}

int main() {
    // Driver processing a packet
    struct NetDriverRequest* tx = alloc_tx_request(2048);
    drop_packet(tx);
    return 0;
}
