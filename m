Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCCBFA8A0
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 09:28:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0BF753F683
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 07:28:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by lists.linaro.org (Postfix) with ESMTPS id B7FD73F683
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 07:28:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=EzZff1wQ;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.216.49 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33ba37b3ff7so757215a91.1
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761118086; x=1761722886; darn=lists.linaro.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vO9KHRnLBvKhkpXd/9jn5kuuFi+mv6wMYt7ZZXt91UI=;
        b=EzZff1wQLt9L/40maHOEMgXcrOse77DlmOSSggIqYlGC1HPDtONdkk/qS81q38xHW1
         n4UzA/ome82GaPSpFMm5qIBTe5CT0vjf+t5TsW9freSWGTkG6wFW9EaMDKgI3KJv0PEo
         CWeCV1kub31Y+JSxKdi5fx7wZrgahADrOjGxmh7z+ZKnidvaGDWYetNLTeqJtJ46j8sd
         yLpLZZbY3ceC8tgRJhHqNKvZE8tNg/NdU6vwO3J88yIxOLllHisjPkOyF3z1XAcYZ/q3
         /W3El7RZskAdv0CT/sdWG0YaV+NEJx3vk2ipOsWBxpIvKC6876NRlb4e1Zq2yMCv9vD0
         rA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118086; x=1761722886;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO9KHRnLBvKhkpXd/9jn5kuuFi+mv6wMYt7ZZXt91UI=;
        b=Uym/BtIl8e47oT1EfbGS2iVCTxaFq66cZEmf7H7WMsl4t5gKvLjD3F6Oq0OerbBNsH
         0l2E+5j3FmyZzszJPowEr3+M1AI93itZBv2+HlW7MyghfJb3340SudNF0EQT0zxPC32m
         TqxYFWKrUUWZBEwdsfDmb2zI59czIi93VKy9dLDkCP4aSLfFbokctTOKjQn5nhKcx+p7
         Bg+vMCji1zaZMyDZWl/bYK/UrE5chhHF38xTrkUtJLipvRK2wJXZVWYLH//5croeFHtG
         uIFhKhzuO8tltdxTcYm3niiJeEYNQ9VV3FLN1WDVVPzVidFq7AzswrM9XmF26qk/DV0P
         YEmA==
X-Gm-Message-State: AOJu0YwPuH0UbJhLc6+lFYwmxwZEkVUI09u7zXecvpaxDi6gD+7mkSJn
	GZRu3t9LkxfkYL8eM2vr9UyFZEp6UubSbHnRJcBIedZpLtHEScS7ulpgks15nzcD/NFGdmdxBG9
	hVIs=
X-Gm-Gg: ASbGncuOhWPL9fWaiVhKXTipzVmPoEtfS5oadbXP2ryGBVFEgEHGS7kPxni5rsbjU+Z
	zQzl+4RdvE/hnFOvSOXMNu1A3SVRU/sjdfSteScN9y6GOnQeABGRXZClbyP7Du08DJhLA49KZ/t
	aDaW0UgsOfyIEZ+4ukDKzHIzaAgAcV+cuVl24eCUYrWyEchicIL79pDKAyqXWif1Ekx4hhWVIOJ
	x4/kAWhKz6/InQNGV3vdxoRK3lxCpMnyFd6/zZS9ob7opjOz32RSRL0H5ZmCwd619KqLTNSsK6h
	F8eBlQq/QdJp7j+UCAQTn3yodZEkEwpsJzNHBMjHLYxH7Ez3x8KZCkPf3cOBbxy5a4ADPIJ7hGK
	q0u1+zNB7JTAyxSO8dG5dhPRKILW1+akRkBCXKIBuoRF7pQHxwlEDAHvS5K5gvqMVrPbeiCuQ0D
	rnjkLOFNA0M4E=
X-Google-Smtp-Source: AGHT+IHFgcS37MSkxyU6h/6VU4QujwEp9l9tioYqbxhwqXHsDJs1YDVW+aLoiaG4Ar2Az1m+PVPn7Q==
X-Received: by 2002:a17:90b:2dc8:b0:32b:94a2:b0c4 with SMTP id 98e67ed59e1d1-33e9120647emr654212a91.16.1761118085605;
        Wed, 22 Oct 2025 00:28:05 -0700 (PDT)
Received: from [192.168.1.10] ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224ca168sm1639039a91.22.2025.10.22.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:28:04 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 22 Oct 2025 12:57:57 +0530
MIME-Version: 1.0
Message-Id: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAHyH+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3fQk3bRy3UTTlCQzCzNLoyTTFCWg2oKi1LTMCrA50bG1tQAuTV4
 NVwAAAA==
X-Change-ID: 20251022-gb-fw-a5db68692b5d
To: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=WNyfnE70judBVS87NToHhBjaPBAnu/cg9W5gM0SBY7Y=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBo+IeAIjBqRHYyxWZfRp+nYQxBKIADZP2+vUCUQ
 J0yrc8WX3WJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaPiHgAAKCRAFzvXHieVa
 dBAQEADj1kutjPIAv3IJLOLqL8oGJfxa9Y3lOJTkHRYeEOvmvwR4Fm3f4SaSx3ivJxh/U19ZES5
 YSvlce7lmCis7bXLNc3LRQWbjcvEK/+WNZhfpZBcHF9zI4SI9CpzPtsX4tWFGg1cy1EzXG7xvwe
 tT2XGd5giCYm0jEVudTnkTx8cH8H3LSwePnSTHcDpkOI8e1s3A2FHRcH11OKs6aVBN3niJlEyeW
 iB3EZe372Qg5pcOJgiYsUUuxYKrysak4Uv3IXpCOmeYLESpRE2II1keXEiAeMBShoF1WJbxm3WY
 rxu4C8Hv3LsmH2E/VrQ3tgX7ETRhjmI4k+XhsowcpKwOiy4p+Z9CZyacQIez2vj4Y1qxfSkcRD/
 ZVgR1sQaSqce8ET3pc8fFhrEOZ34Gdxm7p8ocw6sBSOmLipJ47UxDgttbCickxUXXDFXodTakTd
 l4/ygTprza+uAMvGxSyWI6y2rZhcpI+yS+7u1NWeLgjq+yx3YTsv71E1oLr82rRrkTFBv3wDjko
 Pa5WH8/XW0nD+yqIK9FEn5AwHzDFic5fQSWc0jHO4ZDu1VLbtJh4i9n4e8yqRTrsiYI9ckWLlic
 VUvdISayc87bvT9Uk6/9wMQHsvv955qy11SliSB0EdcjUdrDN0YPoR7Ue5B9x684ew2BcP2bT+T
 Vp+JFekV7RMNN/Q==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B7FD73F683
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.49:from];
	R_SPF_NEUTRAL(0.00)[?all];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.216.49:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: QGWFG3BEZ5M2GMEXQRC5SASPJHRZW6GE
X-Message-ID-Hash: QGWFG3BEZ5M2GMEXQRC5SASPJHRZW6GE
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QGWFG3BEZ5M2GMEXQRC5SASPJHRZW6GE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

According to the Greybus Spec published here [0], the Greybus firmware
download find firmware request should have both tag and format as
request arguments. However, currently, the linux kernel seems to have
defined this request incorrectly since format is missing.

The patch adds format to request and am using it as the file extension of
the firmware.

[0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
According to the Greybus Spec published here [0], the Greybus firmware
download find firmware request should have both tag and format as
request arguments. However, currently, the linux kernel seems to have
defined this request incorrectly since format is missing.

The patch adds format to request and am using it as the file extension of
the firmware.

I came across the bug while working on greybus-for-zephyr [1], to get it
ready for upstreaming as zephyr module.

Open Questions
***************

1. Handle empty format

Not sure what to do in case format is just NULL. Should the request
fail? There is no reason to not support firmware without extension. So
personally, I don't think it should be treated as error.

[0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
[1]: https://github.com/Ayush1325/greybus-for-zephyr
---
 drivers/staging/greybus/fw-download.c     | 31 ++++++++++++++++++++++++-------
 include/linux/greybus/greybus_protocols.h |  2 ++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
 
 /* This returns path of the firmware blob on the disk */
 static struct fw_request *find_firmware(struct fw_download *fw_download,
-					const char *tag)
+					const char *tag, const char *format)
 {
 	struct gb_interface *intf = fw_download->connection->bundle->intf;
 	struct fw_request *fw_req;
@@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
 	}
 	fw_req->firmware_id = ret;
 
-	snprintf(fw_req->name, sizeof(fw_req->name),
-		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
-		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
-		 intf->vendor_id, intf->product_id, tag);
+	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
+		snprintf(fw_req->name, sizeof(fw_req->name),
+			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
+			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
+			 intf->vendor_id, intf->product_id, tag);
+	} else {
+		snprintf(fw_req->name, sizeof(fw_req->name),
+			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
+			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
+			 intf->vendor_id, intf->product_id, tag, format);
+	}
 
 	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
 		 fw_req->name);
@@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
 	struct gb_fw_download_find_firmware_request *request;
 	struct gb_fw_download_find_firmware_response *response;
 	struct fw_request *fw_req;
-	const char *tag;
+	const char *tag, *format;
 
 	if (op->request->payload_size != sizeof(*request)) {
 		dev_err(fw_download->parent,
@@ -245,7 +252,17 @@ static int fw_download_find_firmware(struct gb_operation *op)
 		return -EINVAL;
 	}
 
-	fw_req = find_firmware(fw_download, tag);
+	format = (const char *)request->format;
+
+	/* firmware_format must be null-terminated */
+	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) ==
+	    GB_FIRMWARE_FORMAT_MAX_SIZE) {
+		dev_err(fw_download->parent,
+			"firmware-format is not null-terminated\n");
+		return -EINVAL;
+	}
+
+	fw_req = find_firmware(fw_download, tag, format);
 	if (IS_ERR(fw_req))
 		return PTR_ERR(fw_req);
 
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c2caf8cea3ff0985c92d48d3a2d4c..48d91154847dbc7d3c01081eadc69f96dbe41a9f 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -214,10 +214,12 @@ struct gb_apb_request_cport_flags {
 #define GB_FW_DOWNLOAD_TYPE_RELEASE_FIRMWARE	0x03
 
 #define GB_FIRMWARE_TAG_MAX_SIZE		10
+#define GB_FIRMWARE_FORMAT_MAX_SIZE		10
 
 /* firmware download find firmware request/response */
 struct gb_fw_download_find_firmware_request {
 	__u8			firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE];
+	__u8			format[GB_FIRMWARE_FORMAT_MAX_SIZE];
 } __packed;
 
 struct gb_fw_download_find_firmware_response {

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251022-gb-fw-a5db68692b5d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
