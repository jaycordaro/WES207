#ifndef TX_PACKET_H
#define TX_PACKET_H

class TxPacket
{
private:
	unsigned char* payload;
	const int payload_length;
	unsigned short crc;

public:
	TxPacket(unsigned char* _payload, int _payload_length);

	int get_length();

	class Iterator
	{
	public:
		enum section
		{
			HEADER,
			PAYLOAD,
			CRC,
			END
		};

	private:

		int pos;
		const TxPacket* obj;
		section current_section;
		

	public:

		Iterator(TxPacket* _obj);

		Iterator(section section);

		unsigned char& operator*() const;
		unsigned char* operator->();

		Iterator& operator++();

		Iterator operator++(int);

		friend bool operator== (const Iterator& a, const Iterator& b);
		friend bool operator!= (const Iterator& a, const Iterator& b);

	};

	friend Iterator::Iterator(TxPacket* obj);

	Iterator begin();
	Iterator end();
};

#endif