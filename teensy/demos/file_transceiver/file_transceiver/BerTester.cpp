#include "BerTester.h"

BerTester::BerTester(pattern_t _pattern) :
	pattern(_pattern), state(_pattern >= PRBS_63 ? 0xAAAA : 0), error_total(0)
{
}

void BerTester::fill(unsigned char * buff, int count)
{
	for (int i = 0; i < count; i++)
	{
		buff[i] = next();
	}
}

int BerTester::error_count(unsigned char * buff, int count)
{
	int errors = 0;
	for (int i = 0; i < count; i++)
	{
		errors += errors_in_byte(buff[i], next());
	}

  error_total += errors;
	return errors;
}

unsigned char BerTester::next()
{
	switch (pattern)
	{
	case MK:
		return 0xFF;
	case SP:
		return 0x00;
	case ONE_ONE:
		return 0xAA;
	case ONE_SEVEN:
		return 0x80;
	case ONE_FIFTEEN:
	{
		if (state == 0)
		{
			state = 1;
			return 0x80;
		}
		else
		{
			state = 0;
			return 0x00;
		}
	}
	case PRBS_63:
		return PRBS(6);
	case PRBS_127:
		return PRBS(7);
	default:
		return 0;
	}
}

unsigned char BerTester::PRBS(int N)
{
	const unsigned short mask = (1 << (N - 1)) | 1;
	unsigned char out_byte = 0;
	for (int i = 0; i < 8; i++)
	{
		bool out_bit = state & 1;
		state >>= 1;
		if (out_bit == 0x1)
		{
			state ^= mask;
		}
		out_byte |= (out_bit << i);
	}
	return out_byte;
}

// generated with matlab via:
// for i = 0:255
//   disp([int2str(sum(de2bi(i, 8)))]);
// end
unsigned char error_LUT[256] =
	{ 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3,
	  3, 4, 3, 4, 4, 5, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4,
	  3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4,
	  4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5,
	  3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 1, 2,
	  2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5,
	  4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5,
	  5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
	  3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5,
	  5, 6, 5, 6, 6, 7, 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8 };

int BerTester::errors_in_byte(unsigned char val, unsigned char ref)
{
	unsigned char diff = val ^ ref;

	return error_LUT[diff];
}

const char* BerTester::pattern_name(pattern_t pattern)
{
  switch (pattern)
	{
	case MK:
		return "MK";
	case SP:
		return "SP";
	case ONE_ONE:
		return "ONE_ONE";
	case ONE_SEVEN:
		return "ONE_SEVEN";
	case ONE_FIFTEEN:
		return "ONE_FIFTEEN";
	case PRBS_63:
		return "PRBS_63";
	case PRBS_127:
		return "PRBS_127";
	default:
		return "";
	}
}
