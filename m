Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C346AABAB55
	for <lists+greybus-dev@lfdr.de>; Sat, 17 May 2025 19:24:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7629D44975
	for <lists+greybus-dev@lfdr.de>; Sat, 17 May 2025 17:24:16 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lists.linaro.org (Postfix) with ESMTPS id 2DC503EACA
	for <greybus-dev@lists.linaro.org>; Sat, 17 May 2025 03:41:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=BDU0HRKE;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.181 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70ca2888e99so15556407b3.0
        for <greybus-dev@lists.linaro.org>; Fri, 16 May 2025 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747453301; x=1748058101; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=BDU0HRKEsGgcCsSfDfCm0wLv0ouAlbw8civCp/bmH6upKKupbU/2MQZcem992F+IX9
         wJAqMH9l0nUpkNuAuD3z+h4pIeoUf31DJmEWRPIw6HiS1ooZsdrzEEmtnluqn0ZtIewy
         g0MwG3+SMLvl38Dm0nCiEEIN1FUrzX7Q47MQd0qctgCRW8KaKWXN4iIeA4jMkHnD14Cv
         NCDoz4TaYgPXvczP+Xw3bBMrPZP3C0ZLxbu6iKAUlLW6uYcAr2pWU+MLsGWReA9cVOX+
         qHpCe0yv1FKYrOL/wFiAkv7K4SER2MnG/WSmH6ClzSNUpfwq5nTQsJdh6uLK1r3o9g4V
         Wxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747453301; x=1748058101;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=JnrMoTKUjFNAVb0uiLANS3+go9mrvYdwu3lMZgnxx7JUGN9G0WGHmkrhEvdgwykRfv
         xgzh3yxq121Q248Nvm+6Sl7JjPTrbiO7M1aZLMJzs0ubNu4KEKUVYYYmXLI3V+JtMX0C
         CzkHxJrS/Pl+0unVntqvBSvBAHSKeyllcFJZcpQWgCC8+LLcuvRIeVOfPXd+TOxYW75X
         K3Lfm9ShNpiCwzd2MUzD7fN5TGC+UQ4++YRwK2s/HBn5MJ1bVxWTqfFw+Ma5nfX+KbT8
         W0VqanotseZGi+tlHFrTUIvcBicfeLyFjfYy5h5QSHoP2m+UTfVUeV7Qllzu55IP22zh
         OGWQ==
X-Gm-Message-State: AOJu0YyXevkKQrSkCerF9uXXqt+Pd7a4BLDMtZzQ7ZYpXYgcjgjgC29T
	2K7+IcET+oKTw7QZS+z8tsrRKK3Fq3nQP2w/wkEt1yhI3TRBi3/WzZ/UrCm4noiTGGoVXv51bv6
	RspjTNtSMISNodjNoB7Yv/8nzszTdZPA=
X-Gm-Gg: ASbGncufTfzBVOUctXxtzFX1E43V2m191akwueihy1ce6HY3a2tvM3Hi3f/dEQzMka+
	IhW6Vely3F3kD2olNAKMXLpz2csLxZGmV/b7OdGP/uRs1g/j1OcC46xiEF8vkkAQYpjH3uiHN6h
	0cRpGBLf7bcdUpfAziPywS+fmaZTdUUWXBEkNuOLzAQw+W8eko5/rdJu9BNs0qX5j9EaJSK36Bu
	04=
X-Google-Smtp-Source: AGHT+IF436gN7/jFCxrpB/MU8XA9XIfXcR+aCYz9gELt5k6Au9AARPhYySBUccJehkcH53YIt5y+OndYonj9VJu76H8=
X-Received: by 2002:a05:690c:490d:b0:6fb:b907:d965 with SMTP id
 00721157ae682-70ca79573f4mr81196987b3.3.1747453301148; Fri, 16 May 2025
 20:41:41 -0700 (PDT)
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Sat, 17 May 2025 09:11:30 +0530
X-Gm-Features: AX0GCFtIxtvxIu4R3iOqAZjRuHeebVLNc8s_0cuzSyovkxkXONjjqOzHvDSMjPg
Message-ID: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.181:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	DNSWL_BLOCKED(0.00)[209.85.128.181:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 2DC503EACA
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L7XN42XGFZKCRLIX3BXH3V4RMQEW5HDC
X-Message-ID-Hash: L7XN42XGFZKCRLIX3BXH3V4RMQEW5HDC
X-Mailman-Approved-At: Sat, 17 May 2025 17:24:14 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L7XN42XGFZKCRLIX3BXH3V4RMQEW5HDC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To ensuring that the firmware_tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.

The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
may or may not be NULL-terminated.
included in "greybus_firmware.h"

changes has been made at 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
        intf_load.major = 0;
        intf_load.minor = 0;

-       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
        /* Get Backend Firmware Version */
        printf("Getting Backend Firmware Version\n");

-       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
        /* Try Backend Firmware Update over Unipro */
        printf("Updating Backend Firmware\n");

-       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_update:
--
2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
