Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GEJODmSg2lCpQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:49 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D2EBB7B
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 90789401D1
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 18:38:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by lists.linaro.org (Postfix) with ESMTPS id 310933F795
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 18:31:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="Nl3/jRtI";
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.215.178 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c698873a1deso14192a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229911; x=1770834711; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=Nl3/jRtIXAbj7ocCE5Dj7ZbYfSGik4B9/cLHZRgJX5V8TSFzxCbVqf/JFzAAGpHAmF
         whF58qkccUtfcicuVkf5X8QxcUj68iVqC3XpjZv2yJ1SEOO4uozAAa7kkKB7S2aymEKn
         8+cvnX/ltZE/wnbElXLZPkJYny4IeaRN4JIgelw37jUG/DZ5WGpeWDKm+XPF8kmxDn7M
         VqAQeqhzji+2WzIeyfAnc6iZuUtterRuUl3MR+F3wXJGKIxjx6lO/Ms3sbpmppOonkF6
         ydZI1eZqdzD3VytxJSQpDnDD8DTiE55bR0MOYUCo+Mc11sKYs+Jkc2TxJEZtaYYBdy4D
         lgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229911; x=1770834711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=HMlq4BH9yeLudXh2IxiEXcBoMbTUv/VAZ/Um0B/oXPjLXzBTkdlEDn6lYQNRbC9q4v
         2BG8sxZGX9LG0u1b6P1akZPHuFVIbNm+TamWx8LUrVbRoBSH0xMzO/A71SPjTPYHMKxF
         17biaxBuzw1ltwoikmVYIDRAEmjJZHmIPv9SET8IjeDk5PjLcO8jZYIw0xNfumL7R5Gc
         kCuOYWAbcZ3s9ZnuRlLP0D1WqfLQuiGQchZRe1q/6F9RsRmkkVvlkCSOhY+ZZGYLRw0e
         HWEtaisb5orLfdVdEdZdLRo1ecURn1dtF602cIi+RqbLpMVJ7onI9e3ZPJvBDc0ZpBDg
         qsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+5td1+cUT3aqSbsrRg9jgGxnVe9GWXzOZn+NJbOuawpCCFFHv7j7yUg4OFWMRNDEfaT4pwXl++qtLtA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwCSRHGOnhwHm/hUlHe/OOpABZjUWZTpZnlJHMWRyFIvh4u+bPO
	Y8XkMAOkBDF3qDtxdqXZl2YFAAhw4GBLffBf7LFrnVn9hsna9BF24WLI
X-Gm-Gg: AZuq6aK+DK6FruGj/y8zaeUE1/JnZYjWn2CefWuSER89L24iIQ8KbQ/4HoFez9a6xXM
	S4IC3PIzLsegjtXunVjJk/MfvdornIrgGgfopLWy+xP80t3IBFwnsh21nL+6qM0ivCILFCHtuCj
	2gdtrvJtvVCzNGfnPJ1ZzcGCA4nD1SMKk7pnAaLuBAc2HNKPyI8Q1nl2L3vXcgTCZdjCgjd00WW
	4TpdJXSnuR499xX4dtWvHhUGjoh55ImvI1ftfsPVAU8Xeem1jwmSW+0HrlfBwyw9LmDEaPy62BA
	Zu421CDpa+nVQZij4sXa0NQGvqUs2cxHKsAhfGs/n88QyFWdlQd0sqEpOl66rLy7jNOrsYFZQY5
	4vob2Cvy4GWolk7vsOme0hRiguYHpOmmynb2SNsnN3VoDkImGdhsDXXVKJTQJ9yo3auHpkNmJ1T
	Gowk21Va23rOkH95NfG1/9f624oGWu
X-Received: by 2002:a17:90b:2707:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-354870ebb61mr2904549a91.13.1770229911367;
        Wed, 04 Feb 2026 10:31:51 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354894acb47sm1090041a91.10.2026.02.04.10.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:31:50 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Date: Wed,  4 Feb 2026 18:31:41 +0000
Message-ID: <20260204183142.182785-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NGSRFHSSHU5ROWUOOY6WXS46VBC5FK6B
X-Message-ID-Hash: NGSRFHSSHU5ROWUOOY6WXS46VBC5FK6B
X-Mailman-Approved-At: Wed, 04 Feb 2026 18:38:27 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 4/4] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NGSRFHSSHU5ROWUOOY6WXS46VBC5FK6B/>
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 760D2EBB7B
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
