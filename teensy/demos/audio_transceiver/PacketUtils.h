#ifndef PACKET_UTILS_H
#define PACKET_UTILS_H

enum frame_type
{
	FT_BEACON,
	FT_DATA,
	FT_ACK,
	FT_MAC_COMMAND,
	FT_RESERVED,
	FT_MULTIPURPOSE,
	FT_FRAK,
	FT_EXT
};

enum address_mode
{
	AM_NOT_PRESENT,
	AM_RESERVED,
	AM_SHORT,
	AM_EXT
};

struct __attribute__((__packed__)) Frame_Control
{
	unsigned char frame_type : 3;
	unsigned char security_enabled : 1;
	unsigned char frame_pending : 1;
	unsigned char AR : 1;
	unsigned char PAN_ID_Compression : 1;
	unsigned char : 1;
	unsigned char sequence_number_suppression : 1;
	unsigned char IE_Present : 1;
	unsigned char destination_addressing_mode : 2;
	unsigned char frame_version : 2;
	unsigned char source_addressing_mode : 2;

	constexpr Frame_Control(unsigned char _frame_type,
							unsigned char _security_enabled,
							unsigned char _frame_pending,
							unsigned char _AR,
							unsigned char _PAN_ID_Compression,
							unsigned char _sequence_number_suppression,
							unsigned char _IE_Present,
							unsigned char _destination_addressing_mode,
							unsigned char _frame_version,
							unsigned char _source_addressing_mode) :
		frame_type(_frame_type),
		security_enabled(_security_enabled),
		frame_pending(_frame_pending),
		AR(_AR),
		PAN_ID_Compression(_PAN_ID_Compression),
		sequence_number_suppression(_sequence_number_suppression),
		IE_Present(_IE_Present),
		destination_addressing_mode(_destination_addressing_mode),
		frame_version(_frame_version),
		source_addressing_mode(_source_addressing_mode) {};

	friend bool operator== (const Frame_Control& a, const Frame_Control& b);
};

inline bool operator== (const Frame_Control& a, const Frame_Control& b)
{
	return a.frame_type == b.frame_type &&
		a.security_enabled == b.security_enabled &&
		a.frame_pending == b.frame_pending &&
		a.AR == b.AR &&
		a.PAN_ID_Compression == b.PAN_ID_Compression &&
		a.sequence_number_suppression == b.sequence_number_suppression &&
		a.IE_Present == b.IE_Present &&
		a.destination_addressing_mode == b.destination_addressing_mode &&
		a.frame_version == b.frame_version &&
		a.source_addressing_mode == b.source_addressing_mode;
}

static_assert(sizeof(Frame_Control) == 2, "frame control must be 2 bytes");

struct __attribute__((__packed__)) header_feilds_t
{
  Frame_Control fc;
  unsigned short destination_address;
};

union __attribute__((__packed__)) MAC_Data_Header
{
	header_feilds_t header_feilds;

	unsigned char bytes[4];

	constexpr MAC_Data_Header(Frame_Control _fc, unsigned short _destination_address) :
		header_feilds({_fc, _destination_address}) {};
};

static_assert(sizeof(MAC_Data_Header) == 4, "MAC header must be 4 bytes");

constexpr Frame_Control data_frame_control((unsigned char)FT_DATA, // frame type
											0, // no security
											0, // frame pending not used in DATA frames
											0, // no ack required
											1, // we will not be including PAN IDs
											0, // no sequence number
											0, // no IEs
											(unsigned char)AM_SHORT, // destination short address
											0b10, // frame version using 2020 standard
											(unsigned char)AM_NOT_PRESENT); // no source address)

constexpr unsigned short mac_broadcast_address = 0xFFFF;

template<typename Iterator>
short crc16_calc(Iterator begin, Iterator end)
{
	union shift_reg
	{
		struct
		{
			unsigned char R_1 : 1;
			unsigned char : 2;
			unsigned char R_4 : 1;
			unsigned char R_5 : 1;
			unsigned char : 3;
			unsigned char : 2;
			unsigned char R_11 : 1;
			unsigned char R_12 : 1;
			unsigned char : 3;
			unsigned char R_16 : 1;			
		};

		unsigned short value;

		void shift(unsigned char new_byte)
		{
			for (int i = 0; i < 8; i++)
			{
				unsigned char in = (new_byte >> i) & 0x1;
				unsigned char s1 = (in^R_1);
				unsigned char s2 = (s1^R_12);
				unsigned char s3 = (s1^R_5);

				value <<= 1;
				R_16 = s1;
				R_11 = s2;
				R_4 = s3;
			}
		}
	};

	static_assert(sizeof(shift_reg) == 2, "shift register size is not 2 bytes");

	shift_reg reg;
	reg.value = 0;

	for (Iterator itr = begin; itr != end; itr++)
	{
		reg.shift(*itr);
	}

	return reg.value;
}

constexpr int max_15_4_packet_size = 127;
constexpr int max_payload_size = max_15_4_packet_size - sizeof(MAC_Data_Header);

struct __attribute__((__packed__)) Packet
{
	MAC_Data_Header header;
	unsigned char payload[max_payload_size]; // includes CRC
};

static_assert(sizeof(Packet) == max_15_4_packet_size, "Packet definition is not the correct size");

#endif