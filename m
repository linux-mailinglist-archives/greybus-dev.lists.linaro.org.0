Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF72C602F5
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Nov 2025 11:00:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D6EB3F815
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Nov 2025 10:00:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id 8C9A43F689
	for <greybus-dev@lists.linaro.org>; Sat, 15 Nov 2025 06:18:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=RBnBeFYE;
	spf=pass (lists.linaro.org: domain of nirbhay.lkd@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=nirbhay.lkd@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aace33b75bso2524150b3a.1
        for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 22:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187501; x=1763792301; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=RBnBeFYERL1L0Y5hyMfzIqOhQ8axk/oAvHdIAn4k8f4ppEoaZjMGa+kr6cH4mjVlrh
         MDtMO0xwCM9OnOY3FTNIsD8bZigXMIZ5d9XZ/r+1MIVmZLz2ZARym0CG+6GNTEmsYzgp
         7jtdFXPFPE72rSMKT21FTc5nm/13kIW49q3dWGuCyUwuLLiBbRejNCL0G6EbGLODSaq4
         eXYoGZVlPmA3Jgd06HfV4lyFYcq3dkhW4FWt2EdjEpnRJFCFusJ7Gu05Vo80hvTc5D/7
         Vf9QSFRRIfLhSqhuh/d5GXOe5DKiXfl6q0SLWBKXbIN4G94FEfs62AyaHDurApCCeTag
         8/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187501; x=1763792301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=lKyBQ3VnTCgGvV6vmSYPx94MKt3vKRl9l9zqcqOeCAEFHqpBAS6TstQ9U/hlyG+Z2j
         FXeorE+MNYx976xgY/psI+oJ8W+yHYKmw2O/xZhwFOfbqzJjvSIafP2VCLVsQzc3tec+
         MNtMHkgZty2LSW+tsTAuP/Alk0/MrasGT/hdbwuiilAlJ/seoiNu1xtAiOE2ZggtOJjP
         sciX4uYBy7rQCfUTCZpAzX0pfW9dk7vgHbPjecvVwYDbTCbpNkurvB1QbPodcU/pN7Fh
         thtTlMgeQLnZqlJPLtvELohpqJpW1NCEZ9akZ5ymp8A2DEhl/caTJYwzLMZcQR3nrC0V
         omtg==
X-Gm-Message-State: AOJu0YzRb5uB4DJSbdnNLMWLuubbuQ+LWrTPdM5ZLgaMSf6RTkhJQfYU
	6UfNeNu6H4bVBnJmE7GmZcg8WIRsTPP7E8z06OgSLeUj0bldxsV5MzGJ
X-Gm-Gg: ASbGncvEpmS1CpirNO+EHX80Nt2moKV7Ux02eFGacpCkXhDVVwt+xTyZIR2qS552RRt
	3J31yH9J79GJOg+o5GJYeBGuT32blLSzM6sAP5dYAh6tEEoB5q4fNVztbcU6vlU2NVWfihET1zx
	Z+x7qV3RqA5zzhB++Fw1LQovL6UbDChc3PZwBuAQ42aTy9w99F/3gk/YFg1fYY9deDIpd9kf7hU
	zhIfoLoVH4v4pEq0Q5TuEB5PMfzl8fC18i+zNA4sduQsi3fm07itygUahMlSuuPlgtz8udvBnjh
	k9DkhgF4vZS8gTmye/Q4+Lzsf4RyjXyxVQ/S98KvhPNgqcSVO+7294hvnrXZJlDVJxtmngLS8rM
	EyFON/tKtHQUwDHeXx/5cy/yi3TUtpPUzWqZRNwWVfv8/mMkPdZyQM94kcN3oNRvoEDaRfFtJU4
	1Q44d5oQ3wMM/PDTG1V5XvLCiuO7uc1lQvsiGgcaTY41Yq9JFWBJqvMUomUKtKtshMJFcqzjgJR
	5cPFFd5AzgzME7JimF7/UAgrTQ=
X-Google-Smtp-Source: AGHT+IH1LjD90VbAPuNapbdjB5ZQKWZ42pc4Ga7VXQDXnVR8Okq/prv5bQKCJu1zSNjuVb+IId1/ug==
X-Received: by 2002:a05:6a20:4315:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-35ba219576fmr7346436637.40.1763187500557;
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d24b9sm6976265b3a.17.2025.11.14.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 15 Nov 2025 11:46:47 +0530
Message-ID: <20251115061646.160847-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.181:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.210.181:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,kernel.org,gmail.com,lists.linuxfoundation.org];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8C9A43F689
X-Spamd-Bar: --
X-MailFrom: nirbhay.lkd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LNQGXPAZYJPAY62JSNCPJ3NSTLBV77RE
X-Message-ID-Hash: LNQGXPAZYJPAY62JSNCPJ3NSTLBV77RE
X-Mailman-Approved-At: Sat, 15 Nov 2025 10:00:23 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, Nirbhay Sharma <nirbhay.lkd@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: check return values during probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LNQGXPAZYJPAY62JSNCPJ3NSTLBV77RE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check the return values of send_control() and send_line_coding() during
device initialization in gb_uart_probe(). If these operations fail, the
device will be left in an inconsistent state, so propagate the error to
properly fail the probe.

Both functions call gb_operation_sync() which can fail with errors such
as -ENOMEM, -ENODEV, or -ETIMEDOUT. Ignoring these errors means the TTY
device would be registered despite incomplete initialization.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 10df5c37c83e..5cece0a6606f 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -879,14 +879,18 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	if (retval)
 		goto exit_put_port;
 
-	send_control(gb_tty, gb_tty->ctrlout);
+	retval = send_control(gb_tty, gb_tty->ctrlout);
+	if (retval)
+		goto exit_connection_disable;
 
 	/* initialize the uart to be 9600n81 */
 	gb_tty->line_coding.rate = cpu_to_le32(9600);
 	gb_tty->line_coding.format = GB_SERIAL_1_STOP_BITS;
 	gb_tty->line_coding.parity = GB_SERIAL_NO_PARITY;
 	gb_tty->line_coding.data_bits = 8;
-	send_line_coding(gb_tty);
+	retval = send_line_coding(gb_tty);
+	if (retval)
+		goto exit_connection_disable;
 
 	retval = gb_connection_enable(connection);
 	if (retval)
-- 
2.48.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
