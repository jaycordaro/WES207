#ifndef RX_PACKET_H
#define RX_PACKET_H

#include "PacketUtils.h"

class RxPacket
{
private:
	Packet* packet;
	const int length;
	unsigned short crc;

public:
	RxPacket(Packet* _packet, int _length);

	bool validate_header();

	bool validate_crc();

	unsigned char* begin();
	unsigned char* end();

	unsigned char* payload_begin();
	unsigned char* payload_end();

	int get_payload_len();
};

#endif