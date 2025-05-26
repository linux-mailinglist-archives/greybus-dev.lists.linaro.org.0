Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E8AC45C8
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 02:59:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 44DFA45545
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 00:59:47 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	by lists.linaro.org (Postfix) with ESMTPS id 8BE5D4403B
	for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 12:20:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=We7eWRgW;
	spf=pass (lists.linaro.org: domain of clf700383@gmail.com designates 209.85.215.195 as permitted sender) smtp.mailfrom=clf700383@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-b0b229639e3so247534a12.0
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 05:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748262043; x=1748866843; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1qP9wbzveeHwW+y7xiOlc7El9gt/p09zHHNjg3axz8=;
        b=We7eWRgWQHjE1XLVzeS/4LANCxsV0+awUSxzPMcH1MMaSJh6z6FPQp5inwvON//lpe
         tPKDwabMRs4OnFN9VzGa2cdIFlBadzdfi+hS4oPH7m526w0eWnDGV9Ot9mcX4u8mc/r2
         dZlHTXqeQyQv7Ng8MJgihJb50M09Fw7PMxdqkJgaU0tFx1NN7Bz4kthpi1OoD26mJ2zL
         SZ9JjK9l5diwv65+JWWA2OyL3VyruyLGWe4DbmozsFMSSV1pqUs3moMtjNDgoJqWNDOU
         O2CARno9YyOLC7etwENX7UREUy0aSFHatSWqOT9NeUZnOXpSOgHMHAHTgYQ+tT44aJMa
         q2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262043; x=1748866843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1qP9wbzveeHwW+y7xiOlc7El9gt/p09zHHNjg3axz8=;
        b=bwzhmMQPO/LqFeEzYzItH1U0jthqDP75MOSwS4cTanNVXz7fQrpTuKDy6cXo2cOzNc
         TAzrg02jypMg6bCJrQWRfVqUNUjQHi6bnGHdeN7ixIr4Mw0kU8J4KZZgYmYjg2PNX0xf
         Nc4tp7fDHGPurpxg2KtNtZD3WL2T/3vRf++clHGQMiE0VaEbJKl+Af6DgkoIDBt1ep/l
         zZKoZPrf22Nkg6LrjU14vApYKnNS6b/4s8NGfXB1t4r2R180OMR5uKCloyD/Dqrqc2NS
         Jrpn4GTEPPt9ZeH65aN8XAACi/nQC94ytXcsugca75HAfF53e1L7w2vs3qgjbnnIXzJb
         UQxA==
X-Forwarded-Encrypted: i=1; AJvYcCWS3JEm/8UZWMDj+9iXTJTKR+rw4/zKWVR6wQSd0hLs9PSl7lcburfmOILHCXXKWGZgqViSyFqpshoj1w==@lists.linaro.org
X-Gm-Message-State: AOJu0YxDaaRqCm1I7dLs/7s2DY0y96YXOi4nzLZz6JJ+cOqmpFZYocbv
	yJHfd2h0EB+eeqTB5V3lSLzbmZqzs4mszFhnoWv9M3QmZSibBXbUTT6c
X-Gm-Gg: ASbGncvxq/eDisCV2TQwOuKS8pL5A7Qg8JvDPujt5D8LBR+jXCqGnw17Wb5eKmykcfc
	7yo8Beh6LMiA72LWfgB9/JhuBxfXmYwTu5lDTcnsdl2KdY2ANqcYEwEkgWYkaDtOODVhtJ25LNa
	docyNR6kLX3nQ3+FaeDrdFKP1eXG+QJ/oawZpTCubFUCCabLGnYqhZvhTNkpGYRJjl+vqcaVceA
	LU59BXsmJ7DuxPloE9z/pvMqJehi6T6JAtgPwxoj5nNHbRSesBlZLrn0NFFpO9z+n5I8mqFKK9/
	+Ms2GCXvmKuS1C7/Xdz4lmf2Np8eOQ==
X-Google-Smtp-Source: AGHT+IGHnpvu26eT+6ou5Q3RwYGL3X5EtbEET9L68jcWTK05SMksDFO6nuHOod4yPXX82d9uIKsstQ==
X-Received: by 2002:a05:6a20:3951:b0:215:ea7a:6d2d with SMTP id adf61e73a8af0-2188c331bf2mr5819002637.6.1748262042356;
        Mon, 26 May 2025 05:20:42 -0700 (PDT)
Received: from user.. ([2001:da8:283:e049::9:6ed3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a76f8sm16748805a12.68.2025.05.26.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:20:41 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Date: Mon, 26 May 2025 20:20:20 +0800
Message-Id: <20250526122020.3926640-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.195:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 8BE5D4403B
X-Spamd-Bar: --
X-MailFrom: clf700383@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3SAAMOH647UDJIBE3IWOB7UD3NPPS6TC
X-Message-ID-Hash: 3SAAMOH647UDJIBE3IWOB7UD3NPPS6TC
X-Mailman-Approved-At: Tue, 27 May 2025 00:59:42 +0000
CC: johan@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, clf700383@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Remove gb_control_get_manifest_response struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3SAAMOH647UDJIBE3IWOB7UD3NPPS6TC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The gb_control_get_manifest_response struct is not used.
So we delete it in this commit.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 include/linux/greybus/greybus_protocols.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..dd09dc691dda 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
 	__le16			size;
 } __packed;
 
-/* Control protocol manifest get request has no payload */
-struct gb_control_get_manifest_response {
-	__u8			data[0];
-} __packed;
-
 /* Control protocol [dis]connected request */
 struct gb_control_connected_request {
 	__le16			cport_id;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
