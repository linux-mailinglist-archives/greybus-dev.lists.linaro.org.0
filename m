Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKmuBhtkumklWAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 09:36:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B932B8279
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 09:36:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 844BF401F6
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 08:36:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id 1385A3F764
	for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2026 03:15:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=MBrnM1fj;
	spf=pass (lists.linaro.org: domain of rosenp@gmail.com designates 209.85.214.177 as permitted sender) smtp.mailfrom=rosenp@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b04fc8851cso21645065ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 20:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773717316; x=1774322116; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7IVjiaZD9enlpRseoacY6THrjAA8Z7sB5wwcps0M6c=;
        b=MBrnM1fjchQUj3tSiJbdlzuRRgCcy9B0kxiNiDxwcALdBAIx++XTtLCkBlmxDy394m
         VvWSifjTAgBZnsLqXjsGYiNvCm4unaVLgtc1/lfeDCC43oFdI9VWHHl8Dq0aIcwt8U7I
         sTBNTwEij3GAddVgeR9owIDs8M+m66TkNOy/Bw9nzDNjZz9Gh2ogb/IpOdV4pxsWM2BH
         PoEk6e2dRl/RSiGdCvQpmePSIXiCCfkaFOM4vzl5pFJkJZmwh/vYgTHKSI/7rvYFMycH
         b1FwYZgA2JF7+EYibcoISleiWseZIENbSZ5W8+grN2RfY7P53J7rrTSGm+xew1BCuY8d
         sX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773717316; x=1774322116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7IVjiaZD9enlpRseoacY6THrjAA8Z7sB5wwcps0M6c=;
        b=kRTEv4E+kURvHhZvvFfeL4F+PFnGjftzt6v9+0MNE57O9RVZxdiiBlboEahMUBeaFT
         S5zR5cFQrIcuf0FqWOI4uoxKNeQzPilCc+0Ncj+vrv5TKVHs4vB9QjUk3vDyk2Lv3aRq
         Lz7vc/iqjXzY/HcYs6cj5qFjOmCQzp6mPpvy+C21FZ4DzYJhqYRMWg30Hv+vb/YjTp0Z
         Xr03cuk9y5t4NaP+vKOtlJPvOWMIB8QT+oXbmT2R4lKIwxUfXVsbTGum4x8yg6nGtXhw
         8qsWqK6CCU/4g6uFUk7vnItzvz0phJtlUv4hwCU4pPI55Nolay59tS5QUXA6/ITN3pD9
         Dl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKXi1NKlK3aT70mHkKhYzZmX0fLXvWIaqvI9dk2pPrI00Y2t+e4nZBcoASDdO3Nec58n736WEqRBL6Qw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy0dhJThrZUaeP5UlZ23QF6aQUOmWw6OtkoKFYAPmhqeKHVfDGK
	azUVXaKYyr0p+99B3dq8Asa2ygqTZ2+Mf1+I1Ox9WgivThvSILUWs3HB
X-Gm-Gg: ATEYQzxXty6fvOdaU4Sy1zgLAHxDPo/eeXpFi1QnPFEyZpG5kDdY8CHrNX+00XjH0kr
	h7r6s0I/Y8y0dnPXp565LvOxQBYbFHD1Cf/v+QREdYrB/i3/0DXyRiF/KSZDmgdoHRy8Xfrb4Pl
	NmBcnINpvYawHLtGynvG6banXadE1xdjtlYAoONU6VebivTutHRzl4UuQl20T15QjwkMknrZU5b
	2O0Nsf6tN+SmSv6QJJHS46eijs3lj83hGbHlpx1eVfuG8Qx+HY/AFuybJvVXc7KFiQq5zDEYrig
	Acl95o2v1/myRcQig+nWSSndhBGgoCWkGIqtOv2/yKq+SdBfhZA2vwue1Z6EBo+TyZWBWEq+mzw
	gdQtXLCuV/l/B0gfSRbUAW+EoaGKVySX+NFsM7Ddboiik4pyRbvtfJ8CUul8nzFivsNAGjeQuqX
	gTt88CjWOOcEHtF2akTakJr+HcH5IDdJ2wwdO4GDvS3FyiFsWlJugAqvg=
X-Received: by 2002:a17:902:d542:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2aeca92183fmr180078695ad.1.1773717316151;
        Mon, 16 Mar 2026 20:15:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb7f2basm9824717a12.29.2026.03.16.20.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:15:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 16 Mar 2026 20:14:58 -0700
Message-ID: <20260317031458.93315-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4MGW53EKJAGAZXFCLAGBX52FKX35QMJ6
X-Message-ID-Hash: 4MGW53EKJAGAZXFCLAGBX52FKX35QMJ6
X-Mailman-Approved-At: Wed, 18 Mar 2026 08:36:40 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: svc: use kzalloc_flex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4MGW53EKJAGAZXFCLAGBX52FKX35QMJ6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[29];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.882];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 87B932B8279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Avoid manual sizeof math by using the proper helper.

Also use struct_size for the buffer size.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/greybus/svc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 1b854f53f21e..490577731a19 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -775,10 +775,9 @@ static void gb_svc_pwrmon_debugfs_init(struct gb_svc *svc)
 	if (!rail_count || rail_count > GB_SVC_PWRMON_MAX_RAIL_COUNT)
 		goto err_pwrmon_debugfs;
 
-	bufsize = sizeof(*rail_names) +
-		GB_SVC_PWRMON_RAIL_NAME_BUFSIZE * rail_count;
+	bufsize = struct_size(rail_names, name, rail_count);
 
-	rail_names = kzalloc(bufsize, GFP_KERNEL);
+	rail_names = kzalloc_flex(*rail_names, name, rail_count);
 	if (!rail_names)
 		goto err_pwrmon_debugfs;
 
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
