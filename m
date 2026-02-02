Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPp7LlUTgWkqEAMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE44D1940
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 99D3D3F724
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Feb 2026 21:12:52 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	by lists.linaro.org (Postfix) with ESMTPS id 4C25C3F7F8
	for <greybus-dev@lists.linaro.org>; Mon,  2 Feb 2026 20:35:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=cU85dC+L;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.216.48 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so2628864a91.0
        for <greybus-dev@lists.linaro.org>; Mon, 02 Feb 2026 12:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064532; x=1770669332; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=cU85dC+L8EHHrU1G6oTNdaJMVd7IxO6iFMV8ON/Cu9jnFQkQKYrsIDrR7Lxh5njxA9
         FxO2Jbg+KiIUeHS5GLhw3RXx4yWkWMVPE5jBJSyNW8Oy2M3qacaUjwfuSxXAI2Vv6tF8
         Qk5F1oJ4iT3sokzAlStNnNEOxfRitxnqa37coGTgwklWbTq5a/usr1De03OEqvAizK6E
         xsAyzqETToYeBKYBpNlw5akgJmyeiHDkKM4795ezDSETDrdp1xtyNvyuQ56mOQAW0KRU
         ttM+GcFZuaYn7l5oy9apj8qbZmonZNgQHdum+VLzkEoTualFkjdr+iRxg3T0VEEz0rPM
         DSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064532; x=1770669332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=YJ5kp/3sAvOabKy41kK4mZ7AYVsXRpJaw1OgVN31lPS/iQHCgl5rRRnAs+3pY4hCTc
         7KNedLOJYhM93LGSrDFjxZDvmNEliQcyUH6FveraBWNy4lgPWbth7XJEZKmr+bOmVKLc
         7+3PPU+omupfqTj2vHVzsL3OK6p0lTRBanaNOC0Szn5h4F7yX0Uenkac3555XKE46X8F
         7Mj5AWdAOig4NHzeXB1Sf/LPsYA51eQZ2Olypx+pB9N4avpz0PJB8Z7VTictfrdRiNEF
         eNY5XuTMuxpcS4GOZTtaph7Lp1bRLpYwr+D4+Dj/wdaZQdu8lhUcORXq/M33ntvEhK+b
         khxw==
X-Forwarded-Encrypted: i=1; AJvYcCWqVECTiZK+j1XmW8J2/RDSD0wdidJ6uXupqpzk7NXT0RGnZ38ca813FKnRg3MEWm3LXbQNw7WB0/Wu+g==@lists.linaro.org
X-Gm-Message-State: AOJu0YwK9jsnU6ja+HeoSWsLvI4+xym9CtUXDc2iHQ9vhy4ig1wbQUNL
	Ss/uPQAsGZ5/gV/9wxO7i8VlVghcfvuSWoudoltexvvRf2YLh3IqosIV
X-Gm-Gg: AZuq6aJGFT0EiJN2EMcosmR37RW3DRLc0QWRVSKwBcfav0EFc7jN2WB/xqDb8+t37rw
	OQhl0SQKVMp1y8JsqFQzoeawuoWA3vzPHQF7x9SfgxS91WaK4BXqGYpt+I2iVXJhdrbHgQb43w7
	dd549IrPlBb3IThpHFiQ3isImigKq17JAwoepQ8zpJ01bMkmx3u60l4tb4/xCZy5v1N8q1U6uJe
	VLD9PZ8acQk4SCSfNWgCz1fzwsL+TcMOug4M2LE6GVyUBg/mcmAZcGmnKTRLFsEyeRe1kii40JA
	0Okz2VDPIuY8TqRrWtdFlhRAh1D3sEo3jaGxyM249khqVTGJwla3srQCNw+fQ/ST6Oj6VyTbdch
	0SIjZp2fzC09aaZhGkHwVbjZ0xCk3vWrZPApHsxvI4gN7iY/lxRSVeHsg0fVBesHTNRjl4VBjlC
	m8oz/+SQNL8gxUDnl2hODAnyh9aMCW
X-Received: by 2002:a17:90b:3ccd:b0:353:49f2:1e7a with SMTP id 98e67ed59e1d1-3543b398127mr13163131a91.17.1770064532331;
        Mon, 02 Feb 2026 12:35:32 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm6316663a91.4.2026.02.02.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:35:31 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Date: Mon,  2 Feb 2026 20:35:19 +0000
Message-ID: <20260202203519.160271-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YWI5FBG7UJKCDOAU65CMJRRCTTJXTWDI
X-Message-ID-Hash: YWI5FBG7UJKCDOAU65CMJRRCTTJXTWDI
X-Mailman-Approved-At: Mon, 02 Feb 2026 21:12:39 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YWI5FBG7UJKCDOAU65CMJRRCTTJXTWDI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,checkpatch.pl:url,linaro.org:email]
X-Rspamd-Queue-Id: 8DE44D1940
X-Rspamd-Action: no action

Added comment to mutex declarations, to resolve checkpatch.pl checks.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..1f2faa6d545d 100644
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
