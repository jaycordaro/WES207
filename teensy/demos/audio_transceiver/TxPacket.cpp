#include "TxPacket.h"
#include "PacketUtils.h"

MAC_Data_Header header(data_frame_control, mac_broadcast_address);

TxPacket::TxPacket(unsigned char * _payload, int _payload_length)
	: payload(_payload), payload_length(_payload_length)
{
	crc = crc16_calc<Iterator>(begin(), Iterator(TxPacket::Iterator::CRC));
}

int TxPacket::get_length()
{
	return payload_length + sizeof(header) + sizeof(crc);
}

TxPacket::Iterator TxPacket::begin()
{
	return Iterator(this);
}

TxPacket::Iterator TxPacket::end()
{
	return Iterator(TxPacket::Iterator::END);
}

TxPacket::Iterator::Iterator(TxPacket * _obj)
	: pos(0), obj(_obj), current_section(HEADER)
{
}

TxPacket::Iterator::Iterator(section section)
	: pos(0), obj(nullptr), current_section(section)
{
}

unsigned char& TxPacket::Iterator::operator*() const
{
	switch (current_section)
	{
	case HEADER:
		return header.bytes[pos];
	case PAYLOAD:
		return obj->payload[pos];
	case CRC:
		return *(((unsigned char *) &obj->crc) + pos);
	case END:
	default:
		return *(((unsigned char *) &obj->crc) + sizeof(obj->crc));
	}
}

unsigned char* TxPacket::Iterator::operator->()
{
	return &(**this);
}

TxPacket::Iterator& TxPacket::Iterator::operator++()
{
	int size = 0;
	section next = END;
	switch (current_section)
	{
	case HEADER:
		{
			size = sizeof(MAC_Data_Header);
			next = PAYLOAD;
			break;
		}
	case PAYLOAD:
		{
			size = obj->payload_length;
			next = CRC;
			break;
		}
	case CRC:
		{
			size = sizeof(obj->crc);
			next = END;
			break;
		}
	case END:
	default:
		{
			size = 0;
			next = END;
			break;
		}
	}

	pos++;
	if (pos >= size)
	{
		pos = 0;
		current_section = next;
	}

	return *this;
}

TxPacket::Iterator TxPacket::Iterator::operator++(int)
{
	TxPacket::Iterator ret = *this;
	++(*this);
	return ret;
}

bool operator==(const TxPacket::Iterator & a, const TxPacket::Iterator & b)
{
	return a.pos == b.pos && a.current_section == b.current_section;
}

bool operator!=(const TxPacket::Iterator & a, const TxPacket::Iterator & b)
{
	return ! (a == b);
}
