Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FF6C696CF
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1EE393F918
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id C7E703F72F
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=A4FmZXCV;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e264528aso46578605ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403604; x=1764008404; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jbISlPzDAWNfOTvkBbk/PYbJ5U3qCGdxmwMMQJcFhA=;
        b=A4FmZXCVdPNi3QDk6MSeV5fxdeUd+e9dxCSTFJ7lv9vc8o4bKT7qAONEHIZV3iFy8w
         mKY9c9kMStCprATrKu71NP1DtzsF0nXFni8pI8sCi/0nyRM//L6RwmHoU0XJpDxRxU5H
         epKevGHuPuQgpyPKJYbQdOJk08thig6RMCkQgKc8zGuUMf0a7RhFY9+qHVYrxJspcL0C
         QGjewI5e/8ngD3mjhXQOlIYySFeqE3BEAzNahTbqy0HYhPtOsRsrcuz/tmVDM86TrdBI
         8dgOljqsgHfo3fkKLIRB6g/gXX6g1QHdVKgcwUcnGb24U5+VjuCtTytUVmR01VJssSsc
         eVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403604; x=1764008404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jbISlPzDAWNfOTvkBbk/PYbJ5U3qCGdxmwMMQJcFhA=;
        b=RBcWdoFm4V3g5idrxKcP5ZRcKEfx653bcL+cxPGLupTgFUnw43lFIdkd+zRDcgTFp7
         8Mr3ihRZsn7rEQpvyj2JR9nLTd4LGteAXg/tdoPhLoqC4+H9D8+v3E3iAb0Ihf9bms8z
         AIU9o5mTBLm9x5l7uiexoJANCujStR0QaAYtjHIgJYL/ubcdTLzfriLvNnsnEj/iQooC
         /smWVVwHJGxN8mwMqjkc37HlVsFbrydBU7y2+JpCHKMswktzhLs6sSHdhUtK7RR9ed6H
         mJDXBemsFNYnX3UfENUE3ySypzCqYOe4iABhPQFGSqhmvcFkwa1aM4CyJevC9AgZFy3T
         O+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJvNyVoNggYITt8BoRTfBGJBiH8ESofAjKWtvKrSu6FOK4D2xALnEFbmerJW2XmMIvsP568ixKMYdUjQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YysqB1zNrBAq0LafC5cDtcZ8y9LYWf/SwG4uEI4rfAO1QjQA2uL
	e249KC+ewGI6wFLGOa23XgE3MLtWY3AC266ml7V3Kt4XvRO7tKRIJRn+
X-Gm-Gg: ASbGncscTxO7XjOxg1sAYx5l4/+L8kY3VpsvYoPvlP/+EVW3KEO8OtIILrjv9I10gjo
	fpdXS1a3Y4CHroJ/btcROSZ7/IVU4189NKZ7TeJcvOoMooItBqhh7sN4YiwWXqRC6dVjGDrcrbb
	3XP119rDvA+CvIijczjcHpZ4xgxikQcM0y9iyihEynWRx5MjkspdMGU2DkPzwmgjx1+hrsNw1KW
	c6AF6Zg38CI9Mp3rGROpDrt4L434REcs0GPDInAc4PxnSN0mkI7hbgj0lciCV9f2p/x4eQcpRVl
	fB5jAs5mk6tZJ1stFrvxZe1pr9v8ikI9gIUb2CzkAUA2nZW+wOjWIefKjBZEHdmX24mlAl8wHOK
	run9OsAmheI04dF7OP/b4NK17Jams2G/Nd5ijHGm98j1myTopUHTDPq/dDjiO/+h4NFJl00mNwb
	Z2Lw4bNu38/mztzSMmGzFAUAcUcVIKoIUJNYfvMeOSPgvCGRc=
X-Google-Smtp-Source: AGHT+IHBJUVG9uMdf0kiAeRM6dBSDpiq8MIFpokOGuV99yhq+uO5lWD7lWVxnjC1qKSdHG85rGWk3Q==
X-Received: by 2002:a17:902:e950:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-2986a6b5680mr161298825ad.6.1763403603799;
        Mon, 17 Nov 2025 10:20:03 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:03 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:08 +0530
Message-ID: <20251117181818.118139-4-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: C7E703F72F
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: R42IZ454W2KQAU6VT5NZ3RT3ESVY5YWH
X-Message-ID-Hash: R42IZ454W2KQAU6VT5NZ3RT3ESVY5YWH
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:35 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 03/13] staging: greybus: remove empty TODO file
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R42IZ454W2KQAU6VT5NZ3RT3ESVY5YWH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Greybus TODO file listed two remaining cleanup items:
 - conversion to the GPIO descriptor API
 - conversion of pwm.c to pwm_ops.apply()

Both have now been completed, leaving the TODO file empty.
Remove it as it no longer serves a purpose.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/TODO | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
deleted file mode 100644
index 43fb6dc3dff0..000000000000
--- a/drivers/staging/greybus/TODO
+++ /dev/null
@@ -1,2 +0,0 @@
-* Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
-  ::enable and ::disable.
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
