Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ve3fF3MHNWrHmAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:11 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D40426A4DDE
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=WPl3W8CY;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C91A03F75F
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 09:10:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id AC4433F789
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 04:01:36 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso5095225ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jun 2026 21:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781755296; x=1782360096; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlgP3WwbjZJXNbilGJvZRag7eJ8bdwPgkEsg4GbkJ+s=;
        b=WPl3W8CYKbLrQ9ohgCgbsPoFuO6kx94BUoTj5o2u6BZPXd80hfaP9QmPTLVZworSTV
         RG2Zt0R298RwMWRcIM7rTRUiIjq5F/2gg1sxnsAR47eZlhCueWUqVwwwzufUYtDH8W4p
         g+JasAeJ9/uxy/tb/azxSyVc3XYSTXIu+btpfFv2wmArvgaTRg4fQjE0jVViI+cfcwtZ
         cFPgR3yBWQqMp4IUp2xmzflOa2/+iPT+obvC9sZqpa6wS9HhHELksJh5aEpShuSQcWqH
         4Iv6fM33uJ5BIDuliRCtF/nqhaMWc4d3cFLS6K2o6dk/Frcougo6+qgUSNBua7mxqXMg
         A5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781755296; x=1782360096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlgP3WwbjZJXNbilGJvZRag7eJ8bdwPgkEsg4GbkJ+s=;
        b=E9a7/ml6MWDvjXFZWkYaQtTaf8gUixt9qf0F3kLsy9NeckXJ0xe74DjP7a8cFEKFOh
         Anon/7aSxNArLqp2HfGv4dDfs2tK5tDTvbb8msTQ66BdO5w2gzbZr56ZA1ICS+Jnx5sb
         uHikEsGq7nzwflZWgS8F/ZgD1tgi5SM7PTRuAOqgbN29yMUP+sZT68eOlxQefcGs57ll
         oGBpqGmrx8Gr8Fxm68z8kElko7A1ma4CnMdUd6hb1la0oH9dMr4KSRdQkEpvh1OAm+HH
         +ZYFTEe3d8vfAs3psygdLclhoqJHWRyeWIrMAsq0WpJbCBrfZFvAATXUglYyioCoSpaw
         QJ8w==
X-Gm-Message-State: AOJu0Yy1cseilhSoeq9JkFk+jbxcRnhfa1WsiTo/gPD3aJJW9bRPNHfJ
	PhJeYHYlWClKlZYuBSy3r5QADt1itEVh32TJvwzs/8VbYGV0jIUoQJHw
X-Gm-Gg: AfdE7ckqHxB9ocqPdlHH4QWcTJgI22mP7jP6YtgGD7ESrB2NmsTURZZQbxfKXXlnjEz
	VH5NGuuHZVUuOyfMSBrgvzmLH+L71hmDLO2gjNlCHrjAOIp96SMUimyj4hRFOWIWrHfBB0Sn5jo
	cFIKQ6KC8MhBiYdC2/0gH/71LEE0t8Op4M2mEgSbNSkTQ9D2yvJBMtUAbWKvvcmu/fmAPQqb+YV
	dXVpd7hoKPisnE4YuZoG4tdlblV5Hm4AkNWHUnvV3JLjQqkYPQERjuzqFJGKzZ3Xr01SqJWpcOS
	QDZZu9RiCO1f+9xZEk8DTe/bd1w8FOPIzW5p0+Pmp3D2TAuuSYp6HWA2JuqjyJNqdRHAO832+T6
	ryeasYFwdDGFV5uBy6Nv2/m8acqOvHa4dOkoH1H0AgX/55wX7KjE1qXKwlN20ABMqItvUW/yGPb
	0aXs6u9vZk3cpqS31uvttjYUczF2HEDejO22oOweAk7SGL8TT4dSgdMnOKsWMzIUiecx86//4vi
	akKmcEygHoZjvyPzotQzcqoHfbAofTvPV6wug==
X-Received: by 2002:a17:902:f785:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c6bc25d4d0mr66746685ad.35.1781755295695;
        Wed, 17 Jun 2026 21:01:35 -0700 (PDT)
Received: from localhost ([103.170.55.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52b5sm183091105ad.7.2026.06.17.21.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:01:35 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 18 Jun 2026 04:01:32 +0000
Message-ID: <20260618040132.436-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528135111.2791-1-alfievarghese22@gmail.com>
References: <20260528135111.2791-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: /
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TDYT6SEHBMF4NJSFCJEOPKLHVESPGEXY
X-Message-ID-Hash: TDYT6SEHBMF4NJSFCJEOPKLHVESPGEXY
X-Mailman-Approved-At: Fri, 19 Jun 2026 09:10:05 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: vibrator: return device_create() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TDYT6SEHBMF4NJSFCJEOPKLHVESPGEXY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[29];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D40426A4DDE

Gentle ping on this patch from May 28.

Apologies for the accidental duplicate send; a second copy went out
shortly after this one by mistake. This thread is the canonical one to
review.

Happy to resend or rework if anything is needed.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
