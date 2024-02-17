Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C839B85EDF9
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 01:27:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D9E2143D21
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 00:27:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lists.linaro.org (Postfix) with ESMTPS id D410A3EB98
	for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 15:48:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmx.com header.s=s31663417 header.b=dszkgOkz;
	spf=pass (lists.linaro.org: domain of erick.archer@gmx.com designates 212.227.15.15 as permitted sender) smtp.mailfrom=erick.archer@gmx.com;
	dmarc=pass (policy=quarantine) header.from=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1708184894; x=1708789694; i=erick.archer@gmx.com;
	bh=m3udH/oFmLVSoeOqFqni6TFUPl3SEoscIrls3SQZJH4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=dszkgOkzztj5lH3oYz6944dte02euVjveXo4MZ9FDg5dz8HvLqkRjyNpG4Ex8Ppy
	 SJhCwXnh5ZBa6/0E76KoZjbc144eLfaXuWFplrA2SOA88vUr0cHAcernmzGc0YY4w
	 3owKYjBwknRcpGQQcky1WhoXanM0uoMa/ck0Cz/XTx72xI/hmDWC4KMAeJ/d11SK8
	 9MkRellUsbsksBVm4AGLl7oXMistAKYYjq8V2/fW2FG2lB/z/3cEmdj9E00KNmB4u
	 sq59bbgqqO9fNa/v88/SpsymM2LC6H49/5u2bEUfEPOHXX3G6CDIXOxcbqamPJIIv
	 wacxlccQexsA5f6nIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M6lpM-1rao9Q0aVC-008FTz; Sat, 17 Feb 2024 16:48:14 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Date: Sat, 17 Feb 2024 16:47:58 +0100
Message-Id: <20240217154758.7965-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:R9pjlY/RtF4tfJwPTBxlM53E3eR2D74Esd9b5+KGfGlq7gjlrnC
 GClJFyz+OWZU61AhSXuDAt3OQm6ypcX+qclQR7lZRCACriik1Z+9De3rvK35AOnkK1XfjDw
 8FZvf9oSUtQIav+iEVyjilXRMAOWkSH8UNqYhvuq5biIQ9XDi2mgE8b0iY648I1X3v0eLoD
 yIjt0dynq24NVVPDIJ/HQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MDqSIMhlGG4=;SJX43bNMRrZoLSYrdDdk7Q7dp9i
 EEIv3DLYOm0zuVwzs6cn7C+a4j1jIelgjhDl1p2jx0gUlUpqD1v8/NGY0Z4MwHJdXJtw2ZJxx
 W+Gf5jAe0WLtWTjMJn8ocCK/cz4SIqgwrkoRbsLwskw7Ky5DuRptlwiaqVd7qgn0zcu5TSSc0
 FP3rDOGSrTCaBomiuSamjBbMxv26+k5A8gUcY5xcZ+HIDNi5BiyJTzOJuQhElXpG9x5eg1AAF
 m2bC4ua12ETEiLmMCu1uaLEyLrlFpFL0s5pY5UHe75unrwU2qOz2uIxF28FMzE34fRlmDSA8L
 8n/US90C82SzPOqCL8MZ7MUZgftjcfAV6VU/Czyw8cYDaX2xtrm/pwXmBcCbIQEPDlRdIEaTp
 4S/VuAm9406NlxeuZ8jHAfHmYxU5VcMHxsxJZh1brZA2WmEX3xC1LG7WkJp/taRIlvcGVEgwm
 +WO+aAgm4Tir0duT95VQzuaaNu1Z7p9G81BpKlafpcSmmSZSHrDg5aZnVLvhyvOmnu4AzDBxJ
 jWSHXAjtiXPbWDOTB9zAx/wgFg/XVZy0vrtBHUR+qmDkybfEX8FdGJVMU7V2vmS6MZBA+8GtF
 1eE9REv1apMls9L7Pq3CqOeArSzCFpq6FA4wxPdCWb4xXct2e9/O3nb4jKSFH397ebcrBcoy1
 Q8V7L32UBW8gDx45N60zaXM0uE7gwkW9rMrVGCSm6jjoHblepb1TKEvL8r7YNZgM3wC+i5fIP
 BFnb00D2LEzb7LfWRQBZFhrgP58T3qD0d41yCzLp2HlQet8qVFFvFrQIXG1S8AanPFOrbjjWh
 fdWMCU4K7AjdOWgjTJ575IcmbtOGe03z/POI4q8Uqi2nA=
X-Rspamd-Queue-Id: D410A3EB98
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:mout.gmx.net];
	R_DKIM_ALLOW(-0.20)[gmx.com:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[212.227.15.15:from];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,chromium.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmx.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmx.com];
	ASN(0.00)[asn:8560, ipnet:212.227.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[gmx.com:+];
	FREEMAIL_CC(0.00)[gmx.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: erick.archer@gmx.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5O7C623YN4U2HA322XN4IT2E5JSSLTFU
X-Message-ID-Hash: 5O7C623YN4U2HA322XN4IT2E5JSSLTFU
X-Mailman-Approved-At: Thu, 22 Feb 2024 00:27:18 +0000
CC: Erick Archer <erick.archer@gmx.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: audio: apbridgea: Remove flexible array from struct audio_apbridgea_hdr
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5O7C623YN4U2HA322XN4IT2E5JSSLTFU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a struct containing a flexible array is included in another struct,
and there is a member after the struct-with-flex-array, there is a
possibility of memory overlap. These cases must be audited [1]. See:

struct inner {
	...
	int flex[];
};

struct outer {
	...
	struct inner header;
	int overlap;
	...
};

This is the scenario for the "struct audio_apbridgea_hdr" structure
that is included in the following "struct audio_apbridgea_*_request"
structures:

struct audio_apbridgea_set_config_request
struct audio_apbridgea_register_cport_request
struct audio_apbridgea_unregister_cport_request
struct audio_apbridgea_set_tx_data_size_request
struct audio_apbridgea_prepare_tx_request
struct audio_apbridgea_start_tx_request
struct audio_apbridgea_stop_tx_request
struct audio_apbridgea_shutdown_tx_request
struct audio_apbridgea_set_rx_data_size_request
struct audio_apbridgea_prepare_rx_request
struct audio_apbridgea_start_rx_request
struct audio_apbridgea_stop_rx_request
struct audio_apbridgea_shutdown_rx_request

The pattern is like the one shown below:

struct audio_apbridgea_hdr {
	...
	__u8 data[];
} __packed;

struct audio_apbridgea_*_request {
	struct audio_apbridgea_hdr hdr;
	...
} __packed;

In this case, the trailing flexible array can be removed because it is
never used.

Link: https://github.com/KSPP/linux/issues/202 [1]
Signed-off-by: Erick Archer <erick.archer@gmx.com>
---
Hi everyone,

I'm not sure this patch is correct. My concerns are:

The "struct audio_apbridgea_hdr" structure is used as a first member in
all the "struct audio_apbridgea_*_request" structures. And these last
structures are used in the "gb_audio_apbridgea_*(...)" functions. These
functions fill the "request" structure and always use:

	gb_hd_output(connection->hd, &req, sizeof(req),
		     GB_APB_REQUEST_AUDIO_CONTROL, true);

Then, the "gb_hd_output(struct gb_host_device *hd, ...)" function calls:

	hd->driver->output(hd, req, size, cmd, async);

The first parameter to this function is of type:

	struct gb_host_device {
		...
		const struct gb_hd_driver *driver;
		...
	};

And the "gb_hd_driver" structure is defined as:

	struct gb_hd_driver {
		...
		int (*output)(struct gb_host_device *hd, void *req, u16 size, u8 cmd,
			      bool async);
	};

Therefore, my question is:
Where is the "output" function pointer set? I think I'm missing something.

I have search for another greybus drivers and I have found that, for
example, the "es2_ap_driver" (drivers/greybus/es2.c) sets the "output"
member in:

	static struct gb_hd_driver es2_driver = {
		...
		.output	= output,
	};

I think that the flexible array that I have removed should be used in
the function assigned to the "output" function pointer. But I am not
able to find this function.

A bit of light on this would be greatly appreciated.

Thanks,
Erick
---
 drivers/staging/greybus/audio_apbridgea.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_apbridgea.h b/drivers/staging/greybus/audio_apbridgea.h
index efec0f815efd..ab707d310129 100644
--- a/drivers/staging/greybus/audio_apbridgea.h
+++ b/drivers/staging/greybus/audio_apbridgea.h
@@ -65,7 +65,6 @@
 struct audio_apbridgea_hdr {
 	__u8	type;
 	__le16	i2s_port;
-	__u8	data[];
 } __packed;

 struct audio_apbridgea_set_config_request {
--
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
