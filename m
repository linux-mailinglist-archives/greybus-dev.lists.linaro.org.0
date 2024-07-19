Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B2937892
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 15:34:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7866D40D20
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 13:34:47 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	by lists.linaro.org (Postfix) with ESMTPS id 00ECE40EBD
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 12:39:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marvell.com header.s=pfpt0220 header.b=Imll2wMK;
	spf=pass (lists.linaro.org: domain of "prvs=4930635b6f=hkelam@marvell.com" designates 67.231.156.173 as permitted sender) smtp.mailfrom="prvs=4930635b6f=hkelam@marvell.com";
	dmarc=pass (policy=none) header.from=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JBUCcl021411;
	Fri, 19 Jul 2024 05:39:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=6Sto2vACFW4OjbnTsyaxOP9Ia
	4hUF7CoKat9XLfaWQc=; b=Imll2wMK7aH0NKu6mXUIh+erokzSHhn4MIKRlSuGh
	yPXFOhL431xucT0YNTQCOhu2bs6NBMTha8fuwHEOZA41OepEwmmdyeAZ2ojF7BZU
	4N6n5qHVTc69I+SaCCv/YqBXmpfNFlTCp/jl+dNXN8g36EzXkw4l7xhdv2/eNE3e
	rpjRmmSwogWsdQ4gYq9rBeTGIrgCpEGEdUsyuBU4HlUKNCWHg8Nyg9Xf85EpPOwy
	nOiY2MAavd/zXpPkDmux/0ShiQoDqKX0BPIsdpcYYqIxy4OTBPof+6hW7sUdtrT+
	ZLYRax+K+r9BEl/t6SPFCQ4wIa9sQsrV0TpnOChPUeIPw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 40fe5et4m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 05:39:39 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 19 Jul 2024 05:39:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 19 Jul 2024 05:39:38 -0700
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
	by maili.marvell.com (Postfix) with SMTP id B2B553F7052;
	Fri, 19 Jul 2024 05:39:32 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:09:31 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <Zppeg3eKcKEifJNW@test-OptiPlex-Tower-Plus-7010>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
X-Proofpoint-GUID: tGX4uRD_WjnLeEuD2y3l-visZJL3i78N
X-Proofpoint-ORIG-GUID: tGX4uRD_WjnLeEuD2y3l-visZJL3i78N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Rspamd-Queue-Id: 00ECE40EBD
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[marvell.com,none];
	R_DKIM_ALLOW(-0.20)[marvell.com:s=pfpt0220];
	R_SPF_ALLOW(-0.20)[+ip4:67.231.156.173];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:22843, ipnet:67.231.156.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_VERP_SRS(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkelam@marvell.com,prvs=4930635b6f=hkelam@marvell.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[marvell.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: prvs=4930635b6f=hkelam@marvell.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DRMFPEHFDOOYGJVJPD3FZOJXTIHCF6ML
X-Message-ID-Hash: DRMFPEHFDOOYGJVJPD3FZOJXTIHCF6ML
X-Mailman-Approved-At: Fri, 19 Jul 2024 13:34:42 +0000
CC: robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DRMFPEHFDOOYGJVJPD3FZOJXTIHCF6ML/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 2024-07-19 at 15:15:12, Ayush Singh (ayush@beagleboard.org) wrote:
> Register with firmware upload API to allow updating firmware on cc1352p7
> without resorting to overlay for using the userspace flasher.
> 
> Communication with the bootloader can be moved out of gb-beagleplay
> driver if required, but I am keeping it here since there are no
> immediate plans to use the on-board cc1352p7 for anything other than
> greybus (BeagleConnect Technology). Additionally, there do not seem to
> any other devices using cc1352p7 or it's cousins as a co-processor.
> 
> Boot and Reset GPIOs are used to enable cc1352p7 bootloader backdoor for
> flashing. The delays while starting bootloader are taken from the
> userspace flasher since the technical specification does not provide
> sufficient information regarding it.
> 
> Flashing is skipped in case we are trying to flash the same
> image as the one that is currently present. This is determined by CRC32
> calculation of the supplied firmware and Flash data.
> 
> We also do a CRC32 check after flashing to ensure that the firmware was
> flashed properly.
> 
> Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352p7 Tecnical Specification
> Link: https://openbeagle.org/beagleconnect/cc1352-flasher Userspace
> Flasher
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  drivers/greybus/Kconfig         |   1 +
>  drivers/greybus/gb-beagleplay.c | 625 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 614 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index ab81ceceb337..d485a99959cb 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -21,6 +21,7 @@ config GREYBUS_BEAGLEPLAY
>  	tristate "Greybus BeaglePlay driver"
>  	depends on SERIAL_DEV_BUS
>  	select CRC_CCITT
> +	select FW_UPLOAD
>  	help
>  	  Select this option if you have a BeaglePlay where CC1352
>  	  co-processor acts as Greybus SVC.
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 33f8fad70260..aecbfb5b5eaf 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -6,21 +6,18 @@
>   * Copyright (c) 2023 BeagleBoard.org Foundation
>   */
>  
> -#include <linux/gfp.h>
> +#include <asm-generic/unaligned.h>
> +#include <linux/crc32.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/firmware.h>
>  #include <linux/greybus.h>
> -#include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/printk.h>
>  #include <linux/serdev.h>
> -#include <linux/tty.h>
> -#include <linux/tty_driver.h>
> -#include <linux/greybus/hd.h>
> -#include <linux/init.h>
> -#include <linux/device.h>
>  #include <linux/crc-ccitt.h>
>  #include <linux/circ_buf.h>
> -#include <linux/types.h>
> -#include <linux/workqueue.h>
> +
> +#define CC1352_BOOTLOADER_TIMEOUT 2000
> +#define CC1352_BOOTLOADER_ACK 0xcc
> +#define CC1352_BOOTLOADER_NACK 0x33
>  
>  #define RX_HDLC_PAYLOAD 256
>  #define CRC_LEN 2
> @@ -57,6 +54,17 @@
>   * @rx_buffer_len: length of receive buffer filled.
>   * @rx_buffer: hdlc frame receive buffer
>   * @rx_in_esc: hdlc rx flag to indicate ESC frame
> + *
> + * @fwl: underlying firmware upload device
> + * @boot_gpio: cc1352p7 boot gpio
> + * @rst_gpio: cc1352p7 reset gpio
> + * @flashing_mode: flag to indicate that flashing is currently in progress
> + * @fwl_ack_com: completion to signal an Ack/Nack
> + * @fwl_ack: Ack/Nack byte received
> + * @fwl_cmd_response_com: completion to signal a bootloader command response
> + * @fwl_cmd_response: bootloader command response data
> + * @fwl_crc32: crc32 of firmware to flash
> + * @fwl_reset_addr: flag to indicate if we need to send COMMAND_DOWNLOAD again
>   */
>  struct gb_beagleplay {
>  	struct serdev_device *sd;
> @@ -72,6 +80,17 @@ struct gb_beagleplay {
>  	u16 rx_buffer_len;
>  	bool rx_in_esc;
>  	u8 rx_buffer[MAX_RX_HDLC];
> +
> +	struct fw_upload *fwl;
> +	struct gpio_desc *boot_gpio;
> +	struct gpio_desc *rst_gpio;
> +	bool flashing_mode;
> +	struct completion fwl_ack_com;
> +	u8 fwl_ack;
> +	struct completion fwl_cmd_response_com;
> +	u32 fwl_cmd_response;
> +	u32 fwl_crc32;
> +	bool fwl_reset_addr;
>  };
>  
>  /**
> @@ -100,6 +119,69 @@ struct hdlc_greybus_frame {
>  	u8 payload[];
>  } __packed;
>  
> +/**
> + * enum cc1352_bootloader_cmd: CC1352 Bootloader Commands
> + */
> +enum cc1352_bootloader_cmd {
> +	COMMAND_DOWNLOAD = 0x21,
> +	COMMAND_GET_STATUS = 0x23,
> +	COMMAND_SEND_DATA = 0x24,
> +	COMMAND_RESET = 0x25,
> +	COMMAND_CRC32 = 0x27,
> +	COMMAND_BANK_ERASE = 0x2c,
> +};
> +
> +/**
> + * enum cc1352_bootloader_status: CC1352 Bootloader COMMAND_GET_STATUS response
> + */
> +enum cc1352_bootloader_status {
> +	COMMAND_RET_SUCCESS = 0x40,
> +	COMMAND_RET_UNKNOWN_CMD = 0x41,
> +	COMMAND_RET_INVALID_CMD = 0x42,
> +	COMMAND_RET_INVALID_ADR = 0x43,
> +	COMMAND_RET_FLASH_FAIL = 0x44,
> +};
> +
> +/**
> + * struct cc1352_bootloader_packet: CC1352 Bootloader Request Packet
> + *
> + * @len: length of packet + optional request data
> + * @checksum: 8-bit checksum excluding len
> + * @cmd: bootloader command
> + */
> +struct cc1352_bootloader_packet {
> +	u8 len;
> +	u8 checksum;
> +	u8 cmd;
> +} __packed;
> +
> +#define CC1352_BOOTLOADER_PKT_MAX_SIZE \
> +	(U8_MAX - sizeof(struct cc1352_bootloader_packet))
> +
> +/**
> + * struct cc1352_bootloader_download_cmd_data: CC1352 Bootloader COMMAND_DOWNLOAD request data
> + *
> + * @addr: address to start programming data into
> + * @size: size of data that will be sent
> + */
> +struct cc1352_bootloader_download_cmd_data {
> +	__be32 addr;
> +	__be32 size;
> +} __packed;
> +
> +/**
> + * struct cc1352_bootloader_crc32_cmd_data: CC1352 Bootloader COMMAND_CRC32 request data
> + *
> + * @addr: address where crc32 calculation starts
> + * @size: number of bytes comprised by crc32 calculation
> + * @read_repeat: number of read repeats for each data location
> + */
> +struct cc1352_bootloader_crc32_cmd_data {
> +	__be32 addr;
> +	__be32 size;
> +	__be32 read_repeat;
> +} __packed;
> +
>  static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>  {
>  	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
> @@ -331,11 +413,131 @@ static void hdlc_deinit(struct gb_beagleplay *bg)
>  	flush_work(&bg->tx_work);
>  }
>  
> +/**
> + * csum8: Calculate 8-bit checksum on data
> + */
> +static u8 csum8(const u8 *data, size_t size, u8 base)
> +{
> +	size_t i;
> +	u8 sum = base;
follow reverse x-mas tree
> +
> +	for (i = 0; i < size; ++i)
> +		sum += data[i];
> +
> +	return sum;
> +}
> +
> +static void cc1352_bootloader_send_ack(struct gb_beagleplay *bg)
> +{
> +	static const u8 ack[] = { 0x00, CC1352_BOOTLOADER_ACK };
> +
> +	serdev_device_write_buf(bg->sd, ack, sizeof(ack));
> +}
> +
> +static void cc1352_bootloader_send_nack(struct gb_beagleplay *bg)
> +{
> +	static const u8 nack[] = { 0x00, CC1352_BOOTLOADER_NACK };
> +
> +	serdev_device_write_buf(bg->sd, nack, sizeof(nack));
> +}
> +
> +/**
> + * cc1352_bootloader_pkt_rx: Process a CC1352 Bootloader Packet
> + *
> + * @bg: beagleplay greybus driver
> + * @data: packet buffer
> + * @count: packet buffer size
> + *
> + * @return: number of bytes processed
> + *
> + * Here are the steps to successfully receive a packet from cc1352 bootloader
> + * according to the docs:
> + * 1. Wait for nonzero data to be returned from the device. This is important
> + *    as the device may send zero bytes between a sent and a received data
> + *    packet. The first nonzero byte received is the size of the packet that is
> + *    being received.
> + * 2. Read the next byte, which is the checksum for the packet.
> + * 3. Read the data bytes from the device. During the data phase, packet size
> + *    minus 2 bytes is sent.
> + * 4. Calculate the checksum of the data bytes and verify it matches the
> + *    checksum received in the packet.
> + * 5. Send an acknowledge byte or a not-acknowledge byte to the device to
> + *    indicate the successful or unsuccessful reception of the packet.
> + */
> +static int cc1352_bootloader_pkt_rx(struct gb_beagleplay *bg, const u8 *data,
> +				    size_t count)
> +{
> +	bool is_valid = false;
> +
> +	switch (data[0]) {
> +	/* Skip 0x00 bytes.  */
> +	case 0x00:
> +		return 1;
> +	case CC1352_BOOTLOADER_ACK:
> +	case CC1352_BOOTLOADER_NACK:
> +		WRITE_ONCE(bg->fwl_ack, data[0]);
> +		complete(&bg->fwl_ack_com);
> +		return 1;
> +	case 3:
> +		if (count < 3)
> +			return 0;
> +		is_valid = data[1] == data[2];
> +		WRITE_ONCE(bg->fwl_cmd_response, (u32)data[2]);
> +		break;
> +	case 6:
> +		if (count < 6)
> +			return 0;
> +		is_valid = csum8(&data[2], sizeof(__be32), 0) == data[1];
> +		WRITE_ONCE(bg->fwl_cmd_response, get_unaligned_be32(&data[2]));
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (is_valid) {
> +		cc1352_bootloader_send_ack(bg);
> +		complete(&bg->fwl_cmd_response_com);
> +	} else {
> +		dev_warn(&bg->sd->dev,
> +			 "Dropping bootloader packet with invalid checksum");
> +		cc1352_bootloader_send_nack(bg);
> +	}
> +
> +	return data[0];
> +}
> +
> +static size_t cc1352_bootloader_rx(struct gb_beagleplay *bg, const u8 *data,
> +				   size_t count)
> +{
> +	int ret;
> +	size_t off = 0;
> +
        Same here
      
> +	memcpy(bg->rx_buffer + bg->rx_buffer_len, data, count);
> +	bg->rx_buffer_len += count;
> +
> +	do {
> +		ret = cc1352_bootloader_pkt_rx(bg, bg->rx_buffer + off,
> +					       bg->rx_buffer_len - off);
> +		if (ret < 0)
> +			return dev_err_probe(&bg->sd->dev, ret,
> +					     "Invalid Packet");
> +		off += ret;
> +	} while (ret > 0 && off < count);
> +
> +	bg->rx_buffer_len -= off;
> +	memmove(bg->rx_buffer, bg->rx_buffer + off, bg->rx_buffer_len);
> +
> +	return count;
> +}
> +
>  static size_t gb_tty_receive(struct serdev_device *sd, const u8 *data,
>  			     size_t count)
>  {
>  	struct gb_beagleplay *bg = serdev_device_get_drvdata(sd);
>  
> +	if (READ_ONCE(bg->flashing_mode))
> +		return cc1352_bootloader_rx(bg, data, count);
> +
>  	return hdlc_rx(bg, data, count);
>  }
>  
> @@ -343,7 +545,8 @@ static void gb_tty_wakeup(struct serdev_device *serdev)
>  {
>  	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
>  
> -	schedule_work(&bg->tx_work);
> +	if (!READ_ONCE(bg->flashing_mode))
> +		schedule_work(&bg->tx_work);
>  }
>  
>  static struct serdev_device_ops gb_beagleplay_ops = {
> @@ -412,6 +615,192 @@ static void gb_beagleplay_stop_svc(struct gb_beagleplay *bg)
>  	hdlc_tx_frames(bg, ADDRESS_CONTROL, 0x03, &payload, 1);
>  }
>  
> +static int cc1352_bootloader_wait_for_ack(struct gb_beagleplay *bg)
> +{
> +	int ret;
> +
> +	ret = wait_for_completion_timeout(
> +		&bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +	if (ret < 0)
> +		return dev_err_probe(&bg->sd->dev, ret,
> +				     "Failed to acquire ack semaphore");
> +
> +	switch (READ_ONCE(bg->fwl_ack)) {
> +	case CC1352_BOOTLOADER_ACK:
> +		return 0;
> +	case CC1352_BOOTLOADER_NACK:
> +		return -EAGAIN;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int cc1352_bootloader_sync(struct gb_beagleplay *bg)
> +{
> +	static const u8 sync_bytes[] = { 0x55, 0x55 };
> +
> +	serdev_device_write_buf(bg->sd, sync_bytes, sizeof(sync_bytes));
> +	return cc1352_bootloader_wait_for_ack(bg);
> +}
> +
> +static int cc1352_bootloader_get_status(struct gb_beagleplay *bg)
> +{
> +	int ret;
> +	static const struct cc1352_bootloader_packet pkt = {
> +		.len = sizeof(pkt),
> +		.checksum = COMMAND_GET_STATUS,
> +		.cmd = COMMAND_GET_STATUS
> +	};
> +
     same here. please run checkpatch before submitting to know coding
     style issues.

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
