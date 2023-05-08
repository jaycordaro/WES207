#include "RxPacket.h"

RxPacket::RxPacket(Packet * _packet, int _length)
	: packet(_packet), length(_length)
{
}

bool RxPacket::validate_header()
{
	return packet->header.header_feilds.fc == data_frame_control && packet->header.header_feilds.destination_address == mac_broadcast_address;
}

bool RxPacket::validate_crc()
{
	unsigned short calc_crc = crc16_calc(begin(), payload_end());
	unsigned short rx_crc = *((unsigned short*) payload_end());
	return calc_crc == rx_crc;
}

unsigned char * RxPacket::begin()
{
	return (unsigned char *)packet;
}

unsigned char * RxPacket::end()
{
	return begin() + length;
}

unsigned char * RxPacket::payload_begin()
{
	return begin() + sizeof(MAC_Data_Header);
}

unsigned char * RxPacket::payload_end()
{
	return payload_begin() + get_payload_len();
}

int RxPacket::get_payload_len()
{
	// total length without header or CRC
	return length - sizeof(MAC_Data_Header) - sizeof(unsigned short);
}
