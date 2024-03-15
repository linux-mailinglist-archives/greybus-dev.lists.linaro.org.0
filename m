Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9B87D3F7
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:50:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83C883F368
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:50:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id 7FCCE40A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:50:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=fbw46vCP;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6ade6a66aso2278570b3a.3
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528620; x=1711133420; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJyaNPyqw2IdFqRfIn2kDaXxflGKfLH9sUwkufABDcs=;
        b=fbw46vCPOnYLC2sdlSYLuzzQy3xNnyAkau2pxesNQwLF2+zYOuNf4tXngHp3kRLNl5
         ATX1cBHsqiMWnc8xWDGPS1Y8jhT4UMRk+ZHc8r2A3ezE+ZAr9BO1Jz6uepC3oAfKzbb1
         zNzYEdN1waXAZH0PWbtXfxqWxzBmBrRDC55NOvSfdfr20Ly5la3XIzyyIYCr4F8RpTDA
         DF0n9h1mkiGokLz/pjPKbzI8gL6byS8PIXeiWkFjYV/w8vB87rdT4UYefxaPiamttoAC
         xIZ3mySYpVZuJHZ1T484zndczbA6+EyesDasfMCX0jCBJNLshu5puTzZ1iwEUVrVFDzG
         g9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528620; x=1711133420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJyaNPyqw2IdFqRfIn2kDaXxflGKfLH9sUwkufABDcs=;
        b=YhVNa5H1nPSbQECt40CCTz/uI2c6XApJou4XAa3wC9Cb5+mARPx90NWq32VtFoAOM6
         dF+xj52x36E8bjdRLf9dvnS6LbN7/aGgdOdqveSBBiSxBl/J9tnU9Ujje3uE3BOurjyL
         mpxQp38UpptcAoi0D/Ap2IOTXjeolJCXwb4PuRyn4q91pstdyF4d8gSmfFyZIpuKeHDD
         aMJH1jP5FTEdo3lckciTY05huLJRRNorcaZySVo9AzddxII2dvRyfDhtlfzwtY9R2tVU
         EnrYlQUsvRRuyKY/cfKSCge820ZwrgOj0f5toX3SpXmsdd4R2TxKX4YWfAp9Y2T7MCJG
         ZBbg==
X-Forwarded-Encrypted: i=1; AJvYcCVmaziL2rHUqJ3CB4Sby2y4lhtCH3a1La07qXVWre9AAU7lUhtxwyCKPuH1Qdt1F5OwP8kOtD8A8aUDq9AAf5tFSsgtw400a4WK3tiR
X-Gm-Message-State: AOJu0Yy3OUv0BPa0PDdRl0BkBpbae58o0VCY3t/nXiSzDumTv21t6fyP
	RDXb8TnyhiDCIhFiET98IsfReSdre7IHjmSOojkZV/EI1Pxe+EnB
X-Google-Smtp-Source: AGHT+IHc7+H5cEGXqrctyaczStsb2ofp2iqgC06SmJk8JFddX4axEu63mOXWmXYSgCe6j/iNGhO5GQ==
X-Received: by 2002:a05:6a00:841:b0:6e6:8c49:f2f6 with SMTP id q1-20020a056a00084100b006e68c49f2f6mr6144160pfk.24.1710528619634;
        Fri, 15 Mar 2024 11:50:19 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:50:19 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:04 +0530
Message-ID: <20240315184908.500352-7-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7FCCE40A53
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.178:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: MMBA4DTIX5E6V7W2DNOXH6OCUOSQZAJ7
X-Message-ID-Hash: MMBA4DTIX5E6V7W2DNOXH6OCUOSQZAJ7
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 6/8] greybus: Add mikroBUS manifest types
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MMBA4DTIX5E6V7W2DNOXH6OCUOSQZAJ7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add data structures for parsing mikroBUS manifests, which are based on
greybus manifest.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 include/linux/greybus/greybus_manifest.h | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/linux/greybus/greybus_manifest.h b/include/linux/greybus/greybus_manifest.h
index bef9eb2093e9..83241e19d9b3 100644
--- a/include/linux/greybus/greybus_manifest.h
+++ b/include/linux/greybus/greybus_manifest.h
@@ -23,6 +23,9 @@ enum greybus_descriptor_type {
 	GREYBUS_TYPE_STRING		= 0x02,
 	GREYBUS_TYPE_BUNDLE		= 0x03,
 	GREYBUS_TYPE_CPORT		= 0x04,
+	GREYBUS_TYPE_MIKROBUS		= 0x05,
+	GREYBUS_TYPE_PROPERTY		= 0x06,
+	GREYBUS_TYPE_DEVICE		= 0x07,
 };
 
 enum greybus_protocol {
@@ -151,6 +154,49 @@ struct greybus_descriptor_cport {
 	__u8	protocol_id;	/* enum greybus_protocol */
 } __packed;
 
+/*
+ * A mikrobus descriptor is used to describe the details
+ * about the bus ocnfiguration for the add-on board
+ * connected to the mikrobus port.
+ */
+struct greybus_descriptor_mikrobus {
+	__u8 pin_state[12];
+} __packed;
+
+/*
+ * A property descriptor is used to pass named properties
+ * to device drivers through the unified device properties
+ * interface under linux/property.h
+ */
+struct greybus_descriptor_property {
+	__u8 length;
+	__u8 id;
+	__u8 propname_stringid;
+	__u8 type;
+	__u8 value[];
+} __packed;
+
+/*
+ * A device descriptor is used to describe the
+ * details required by a add-on board device
+ * driver.
+ */
+struct greybus_descriptor_device {
+	__u8 id;
+	__u8 driver_stringid;
+	__u8 protocol;
+	__u8 reg;
+	__le32 max_speed_hz;
+	__u8 irq;
+	__u8 irq_type;
+	__u8 mode;
+	__u8 prop_link;
+	__u8 gpio_link;
+	__u8 reg_link;
+	__u8 clock_link;
+	__u8 pad[1];
+} __packed;
+
 struct greybus_descriptor_header {
 	__le16	size;
 	__u8	type;		/* enum greybus_descriptor_type */
@@ -164,6 +210,9 @@ struct greybus_descriptor {
 		struct greybus_descriptor_interface	interface;
 		struct greybus_descriptor_bundle	bundle;
 		struct greybus_descriptor_cport		cport;
+		struct greybus_descriptor_mikrobus	mikrobus;
+		struct greybus_descriptor_property	property;
+		struct greybus_descriptor_device	device;
 	};
 } __packed;
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
