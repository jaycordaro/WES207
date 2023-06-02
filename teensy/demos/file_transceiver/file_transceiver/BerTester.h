#ifndef BERT_H
#define BERT_H

class BerTester
{
public:
	enum pattern_t
	{
		MK,
		SP,
		ONE_ONE,
		ONE_SEVEN,
		ONE_FIFTEEN,
		PRBS_63,
		PRBS_127,
    NONE
	};

	pattern_t pattern;
	unsigned short state;
  unsigned int error_total;

	BerTester(pattern_t _pattern);

	void fill(unsigned char* buff, int count);

	int error_count(unsigned char* buff, int count);

  static const char* pattern_name(pattern_t pattern);

private:
	unsigned char next();

	unsigned char PRBS(int N);

	int errors_in_byte(unsigned char val, unsigned char ref);
};

#endif