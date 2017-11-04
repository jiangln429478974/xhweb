/*
 * Created on 2005-7-12
 *
 */
package com.qyxx.client;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import sun.misc.BASE64Decoder;

/**
 * Provides base 64 encoding.
 */
public class Base64 {

  /**
   * Encode a byte array as a Base64 String as per RFC 1521.
   *
   * @param bToEncode Byte array to encode
   * @return The encoded String
   * @throws IOException Problem encountered encoding
   */
  public static String encode(byte[] bToEncode) throws IOException {
    if (bToEncode.length == 0) {
      return new String();
    }
    // Read the bytes from a stream
    ByteArrayInputStream bais = new ByteArrayInputStream(bToEncode);

    // Concatenate the Base 64 encoding in here
    StringBuffer sbBase64 = new StringBuffer();

    byte[] buff = new byte[3];
    int iRead;
    int iTmp = 0;
    char[] cAppend = new char[4];

    // Convert every set of three bytes to their equivalent four Base 64 characters
    // (three bytes (24 bits) == four base 64 chars (24 bits))
    while ( (iRead = bais.read(buff, 0, buff.length)) != -1) {
      if (iRead == 0) {
        continue;
      }

      // "Concatenate" the 1-3 bytes read into an int
      if (iRead > 0) {
        iTmp = (buff[0] & 0xFF);
      }
      iTmp <<= 8;

      if (iRead > 1) {
        iTmp |= (buff[1] & 0xFF);
      }
      iTmp <<= 8;

      if (iRead > 2) {
        iTmp |= (buff[2] & 0xFF);
      }

      // Read them out in reverse order creating the Base 64 encoded
      // character for every 6 bits

      // Fourth Base 64 character
      if (iRead == 3) { // 3 bytes provided
        cAppend[3] = m_cBase64[ (iTmp & 0x3F)];
      } else { // < 3 bytes provided
        cAppend[3] = m_cBase64Pad;
      }

      // Third Base 64 character
      iTmp >>>= 6;

      if (iRead > 1) { // 2-3 bytes provided
        cAppend[2] = m_cBase64[ (iTmp & 0x3F)];
      } else { // < 2 bytes provided
        cAppend[2] = m_cBase64Pad;
      }

      // Second Base 64 character
      iTmp >>>= 6;
      cAppend[1] = m_cBase64[ (iTmp & 0x3F)];

      // First Base 64 character
      iTmp >>>= 6;
      cAppend[0] = m_cBase64[ (iTmp & 0x3F)];

      // Store the subset of the Base 64 encoding
      sbBase64.append(cAppend);
    }

    bais.close();

    // Return the Base 64 encoding
    return sbBase64.toString();
  }

  /**
   * decode the base 64 encoded bytes data.
   *
   * @return a byte array representing the decoded data.
   */
  public static byte[] decode(byte[] data) {
    if (data == null || data.length < 2) {
      return new byte[] {};
    }
    byte[] bytes;
    byte b1, b2, b3, b4;

    if (data[data.length - 2] == '=') {
      bytes = new byte[ ( ( (data.length / 4) - 1) * 3) + 1];
    } else if (data[data.length - 1] == '=') {
      bytes = new byte[ ( ( (data.length / 4) - 1) * 3) + 2];
    } else {
      bytes = new byte[ ( (data.length / 4) * 3)];
    }

    for (int i = 0, j = 0; i < data.length - 4; i += 4, j += 3) {
      b1 = decodingTable[data[i]];
      b2 = decodingTable[data[i + 1]];
      b3 = decodingTable[data[i + 2]];
      b4 = decodingTable[data[i + 3]];

      bytes[j] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[j + 1] = (byte) ( (b2 << 4) | (b3 >> 2));
      bytes[j + 2] = (byte) ( (b3 << 6) | b4);
    }

    if (data[data.length - 2] == '=') {
      b1 = decodingTable[data[data.length - 4]];
      b2 = decodingTable[data[data.length - 3]];

      bytes[bytes.length - 1] = (byte) ( (b1 << 2) | (b2 >> 4));
    } else if (data[data.length - 1] == '=') {
      b1 = decodingTable[data[data.length - 4]];
      b2 = decodingTable[data[data.length - 3]];
      b3 = decodingTable[data[data.length - 2]];

      bytes[bytes.length - 2] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[bytes.length - 1] = (byte) ( (b2 << 4) | (b3 >> 2));
    } else {
      b1 = decodingTable[data[data.length - 4]];
      b2 = decodingTable[data[data.length - 3]];
      b3 = decodingTable[data[data.length - 2]];
      b4 = decodingTable[data[data.length - 1]];

      bytes[bytes.length - 3] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[bytes.length - 2] = (byte) ( (b2 << 4) | (b3 >> 2));
      bytes[bytes.length - 1] = (byte) ( (b3 << 6) | b4);
    }

    return bytes;
  }

  /**
   * decode the base 64 encoded String data.
   *
   * @return a byte array representing the decoded data.
   */
  public static byte[] decode(String data) {
    if (data == null || data.length() < 2) {
      return new byte[] {};
    }
    byte[] bytes;
    byte b1, b2, b3, b4;

    if (data.charAt(data.length() - 2) == '=') {
      bytes = new byte[ ( ( (data.length() / 4) - 1) * 3) + 1];
    } else if (data.charAt(data.length() - 1) == '=') {
      bytes = new byte[ ( ( (data.length() / 4) - 1) * 3) + 2];
    } else {
      bytes = new byte[ ( (data.length() / 4) * 3)];
    }

    for (int i = 0, j = 0; i < data.length() - 4; i += 4, j += 3) {
      b1 = decodingTable[data.charAt(i)];
      b2 = decodingTable[data.charAt(i + 1)];
      b3 = decodingTable[data.charAt(i + 2)];
      b4 = decodingTable[data.charAt(i + 3)];

      bytes[j] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[j + 1] = (byte) ( (b2 << 4) | (b3 >> 2));
      bytes[j + 2] = (byte) ( (b3 << 6) | b4);
    }

    if (data.charAt(data.length() - 2) == '=') {
      b1 = decodingTable[data.charAt(data.length() - 4)];
      b2 = decodingTable[data.charAt(data.length() - 3)];

      bytes[bytes.length - 1] = (byte) ( (b1 << 2) | (b2 >> 4));
    } else if (data.charAt(data.length() - 1) == '=') {
      b1 = decodingTable[data.charAt(data.length() - 4)];
      b2 = decodingTable[data.charAt(data.length() - 3)];
      b3 = decodingTable[data.charAt(data.length() - 2)];

      bytes[bytes.length - 2] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[bytes.length - 1] = (byte) ( (b2 << 4) | (b3 >> 2));
    } else {
      b1 = decodingTable[data.charAt(data.length() - 4)];
      b2 = decodingTable[data.charAt(data.length() - 3)];
      b3 = decodingTable[data.charAt(data.length() - 2)];
      b4 = decodingTable[data.charAt(data.length() - 1)];

      bytes[bytes.length - 3] = (byte) ( (b1 << 2) | (b2 >> 4));
      bytes[bytes.length - 2] = (byte) ( (b2 << 4) | (b3 >> 2));
      bytes[bytes.length - 1] = (byte) ( (b3 << 6) | b4);
    }

    return bytes;
  }

  /*
   * set up the decoding table.
   */
  private static final byte[] decodingTable;

  static {
    decodingTable = new byte[128];

    for (int i = 'A'; i <= 'Z'; i++) {
      decodingTable[i] = (byte) (i - 'A');
    }

    for (int i = 'a'; i <= 'z'; i++) {
      decodingTable[i] = (byte) (i - 'a' + 26);
    }

    for (int i = '0'; i <= '9'; i++) {
      decodingTable[i] = (byte) (i - '0' + 52);
    }

    decodingTable['+'] = 62;
    decodingTable['/'] = 63;
  }

  /** Base 64 digits 0-63 */
  private static final char[] m_cBase64 = {
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
      'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
      'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
      't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
      '8', '9', '+', '/'};

  /** Base 64 padding character */
  private static final char m_cBase64Pad = '=';

  public static String getBASE64(String s){
	    if (s == null) return null;
	   
	    byte[] b=null;
	    try {
			b=s.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  return (new sun.misc.BASE64Encoder()).encode( b );
  }
  public static String getFromBASE64(String s) {
	  if (s == null) return null;
	  BASE64Decoder decoder = new BASE64Decoder();
	  try {
	    byte[] b = decoder.decodeBuffer(s);
	    return new String(b);
	  } catch (Exception e) {
	    return null;
	  }
  }

  /**
   * Private to prevent construction.
   */
  private Base64() {}

}
