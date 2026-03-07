Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLuIBST/rWk++gEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:44 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FA23297C
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C6C363F9B5
	for <lists+greybus-dev@lfdr.de>; Sun,  8 Mar 2026 22:58:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id 7EE7D3F827
	for <greybus-dev@lists.linaro.org>; Sat,  7 Mar 2026 14:10:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Eto9a2Dv;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso791523b3a.0
        for <greybus-dev@lists.linaro.org>; Sat, 07 Mar 2026 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892606; x=1773497406; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlLqhfSeoTjEi2J59uhJ9PC75EMBz81L4kAgByHwzGM=;
        b=Eto9a2Dvszhp/6Q9oSf9i3vSfvzmIPMgYgcGiL9KN7Ymg7JTsC3/DwPqta2yCkI7rN
         ojo8HnmzELNTjtDWDXkzm4z4hKnuztEu0LGragzMILB/iwNw+mNu6HxUOGrZRqe9UeSO
         eBZ1hj6fElSX2KxIT35IWR1ixhwci//oDtA8eVKeoACJs53BcQRj50/gErbTFZDz1Iyn
         bFkiBUrSXL5gAdxMu+gQGwu9AtAZYmuTSHdD3W2qZ+9AkR1tsIjcDXVWkLs9q37N++fi
         Dlz5DYHtEPS5xKeg+gAvu/lXrEdGbAtM6Sp4PiMaCmgADlidnXiH8j+y8J9FiKlZ0479
         EsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892606; x=1773497406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlLqhfSeoTjEi2J59uhJ9PC75EMBz81L4kAgByHwzGM=;
        b=i/2Ya01t9yV/ArdKuW1nONnOF//7BawDOkMP70GVnJBQiYnjxVfQ3JvJ+yn4jsoj8Z
         ui6Tr7TzxOPXT2HO/e8TYPKnx2CHBYdYoIQwfecJRxxxKwLMObxx9fTXFqBMOZV0rAP9
         61cFQkd23F6mquUQbeY2GFcygwNzagn9peApNpZIAsKColdy2Vh9z0ZYiTIaQtZ1nenM
         pOjVJNgS+vowV9TTP5Dk0TYJwsX0rWDbF1YeixE65TYAp+HoFjrmm/tsy7Je5BFCnQgU
         YgHwmoRqK2abVL0/N1iOWKLd7o/0koQ//PmnNP0rVKkwsdJgDPLy6tDl88QBztiwe3ry
         cK7g==
X-Forwarded-Encrypted: i=1; AJvYcCWHourpVuGQvPAPEqaXOHLGi+5DuUA6DKKaZQqZBp4UT4MJnpicLFjLgbPDhP/on6R+jZ+OrnqeBJ5vPQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx/DAv3qGCMaf0ViWTP9b20hxfoJA5REEi37DhW46YtOL6fs1rM
	C0lPZPxq+Hs0usstH5zUVvYYAWzIjbp0bqsHURBDKO4uvGIhs1vRUM+M
X-Gm-Gg: ATEYQzxGyw+bQSPg1RXmwWJU0uZOHAOfVqCwXkSfM0kCFtRCiZjtRUEMYP/y5LSciyP
	WpD+XXhtp3DQ1xjTO4/M0spuh1nIXwjQQJMveWT+jsu2bKBGtTO4OAsOERMsQaOd5I2D1MQR7U1
	Nd7SRULm8tekZD5VxnDoML+boCznHNZf/kFINDb+RWrFjg1On/80BG10GoG4PQK88/Do6s4kHiQ
	p/BuSWl8Azjnx1cUG+04ZSjeDHfoZkj2sd34JZn1lpeOAF6/b9TwDnKfGPNP3QQhyzQCKi5Glu1
	VUwOlvV8w6PsL6SrqHzinzxXTkUkDcGg1+PwOInXw8KAxna3LCcAY3/0V660d4T9P+IfCGhJYoj
	M2u0NmJL+i/sbQDZgwEgAr5zdMY9nwqedZAGX+mtdJ1aHMOsj4DpaOwrwaVF+3meTrpeC17hJWi
	rTqw2Hv4vhjEG/eQFJCJWv5I42MQMfSucfsWQ5iaRcS7AWs+wfjZah/747iUfMVlMJ2jpTsG1gP
	34Koef6n5r7cVJIEDFb6G9S
X-Received: by 2002:a05:6a00:2d1e:b0:827:3845:921 with SMTP id d2e1a72fcca58-829a2e16119mr4416008b3a.27.1772892605629;
        Sat, 07 Mar 2026 06:10:05 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:10:05 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Date: Sat,  7 Mar 2026 14:09:25 +0000
Message-ID: <20260307140930.1732-3-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307140930.1732-1-rchtdhr@gmail.com>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PJXHEL436HNPIB4MWKE6N7D4K75G7RVQ
X-Message-ID-Hash: PJXHEL436HNPIB4MWKE6N7D4K75G7RVQ
X-Mailman-Approved-At: Sun, 08 Mar 2026 22:58:33 +0000
CC: Rachit Dhar <rchtdhr@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PJXHEL436HNPIB4MWKE6N7D4K75G7RVQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A84FA23297C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[32];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.638];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,checkpatch.pl:url,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

Added comments to mutex declarations, to resolve the associated checkpatch.pl checks:

CHECK: struct mutex definition without comment
+       struct mutex                    lock;

CHECK: struct mutex definition without comment
+       struct mutex            lights_lock;

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..1391c2b5d5f4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 	bool				releasing;
 	bool				strobe_state;
 	bool				active;
-	struct mutex			lock;
+	struct mutex			lock; /* protects gb_channel->active */
 };
 
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 	struct gb_connection	*connection;
 	u8			lights_count;
 	struct gb_light		*lights;
-	struct mutex		lights_lock;
+	struct mutex		lights_lock; /* protects gb_lights->lights */
 };
 
 static void gb_lights_channel_free(struct gb_channel *channel);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
