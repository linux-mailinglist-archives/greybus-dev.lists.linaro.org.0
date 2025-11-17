Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E58C696ED
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1451C3F943
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 951F83F8F0
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=KvgIqGRb;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298144fb9bcso49047315ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403631; x=1764008431; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zqpFfSTxt6k4olHubnKsjeBvml78pm5/tIXaoImcTM=;
        b=KvgIqGRb42848r1NZWVxkaPXPRFEqpvIBzrmaaIVW51G9XJ8rqNHrOJbVmigsnw63e
         D9SPrMeTkaPS3C5O1f04GAjk7ORo32vUQ+6P11GAcBXtC7ifwH4dID941WYoSkxe20Z8
         jJUzL/LpXeteJGpPRKgt4NJGBmmy6dv9pxGboQYgJlANBpfT3QfRBmkmDmSKHfzyyeb6
         PlKi7/WbxNo+VW5oycQHhfJaN2CI6w44wiBitw/OPb3kaqOmp4yzebbZoAuZmTJVISdm
         qMHwVANs5T/dvzKN0ylQoIjDCpPuWLuOVNxdc+kH85C0oIYuHxTB27ew8BFVochKhFAo
         raoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403631; x=1764008431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5zqpFfSTxt6k4olHubnKsjeBvml78pm5/tIXaoImcTM=;
        b=rVHsppWSbSoufOPxFXxMFVV/pDvrgIeA1mBdx08YBI2GSTGZZInm6o2Tdd87TTdEbF
         6NgV11YagQQnPo0Z8hC9DBpPud2k//mjr8YjBsFOjwM5yr7OGv9FBaX7zgxQbAU7hlTp
         Mcb0VPxzhqD7qIpeyz1525RHxXGxRx1dwc7cZgFoF1lbv70ZhSXLhpNxeazaWBFUA7Go
         VNpCIj6okOdNRAajRv0zO1SQCYnRbsctrhDraT0W8SAgwLvdb44W4xh3/ZdcHPs+3idj
         +q/7YRxx53gp6FNrxdNZGdRyI1K5+4d5K2z5H5vdK7pqj6fW+Gi0F85Mz5wCGo2k8+n7
         ugkA==
X-Forwarded-Encrypted: i=1; AJvYcCXS0tsX89jXPidI6I9Rx7/mqGMxyc3MzhgmLKo3/Yr2x9/5IzgQXNu5E/3xuPqsYo3lZZLlHvure9tHYA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwRi+/NpXZ9KIh2zZp2I0bQK2ARTYS50u5kV0mW57lM4JSTEDv2
	gg/0NCBi3sHl0tEX0+easnrRzHryoTSUiP0OI1S39KJwszwK5MqhNNNt
X-Gm-Gg: ASbGncsRSNEcRiOQ57x/hSK+D6ncYy3zsZh69qf2bLBQ6NAK+GDnzxvlrD56M5FSGH/
	VizO5E2mvMFgi/RnUa+l4poWBlHIGi3TOoIxd0T+KUMMzk00WhfV60f2vdU6TTpiXh9g/WS7ibk
	VEZ/zTDK73GvfTLlPW1XuBVV7glcRdEON6piosofX4hNlXO0lDInQCiPXo0uCN94cMbcnfGApyp
	bcdFvcrbvRLj+bPCSFhnQ290qLQGTdJsw5oV/L9rs35f7OvEnED1tEz7+DcE4W43gD46a9Jjch+
	PUP45jIp7Nc93FUo25MVfnXvGZkEEK/6pJ9c3qbiFLN/K2/gDhU03td4quhYPtrtlgOLVNFampg
	NCXvPcKHy5Ugm6287rCbeN07Od+5XpwuTmxuR9AMKP4qKenMr++lJdUnO0/YDcFTt/UiQqOqlZ0
	3Cf0dQIQOaSmqd6R4rQ6/f/TSze+ER/gniqHS5O4jR+v9m3j8=
X-Google-Smtp-Source: AGHT+IEIVPzECjsDHbIbkO/QDUbP3Jsg29my+qlUCT8wwemnsmBxOECXClYGm0ROW93roGU1v+RIWA==
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr151503745ad.39.1763403630739;
        Mon, 17 Nov 2025 10:20:30 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:30 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:17 +0530
Message-ID: <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 951F83F8F0
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5AJSMEHCLBHI6UTMQVPGAKGFNHNG4RJ4
X-Message-ID-Hash: 5AJSMEHCLBHI6UTMQVPGAKGFNHNG4RJ4
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:56 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 12/13] staging: greybus: usb: validate hub control response length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5AJSMEHCLBHI6UTMQVPGAKGFNHNG4RJ4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Clamp hub control wLength to a reasonable maximum before allocating
the response buffer to avoid oversized allocations and remove the
FIXME about unspecified lengths.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/usb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 475f24f20cd4..1502641f5dbb 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -105,7 +105,13 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	size_t response_size;
 	int ret;
 
-	/* FIXME: handle unspecified lengths */
+	/*
+	 * Clamp wLength to a reasonable maximum to avoid oversized allocations.
+	 * USB control responses are expected to be small, use 2K as a safe
+	 * upper bound for the response payload.
+	 */
+	if (wLength > 2048)
+		wLength = 2048;
 	response_size = sizeof(*response) + wLength;
 
 	operation = gb_operation_create(dev->connection,
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
