Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YGd9EGtFV2qiIQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:39 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6F75BE62
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=qi7KCJrv;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78B24404DD
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 08:31:37 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lists.linaro.org (Postfix) with ESMTPS id 675B540156
	for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 08:48:04 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44cc65b0a7fso526182fac.0
        for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018884; x=1784623684; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHa72c4+nay2FoW1wgA2FzfDfV81XjSTaeTSFxhPGw4=;
        b=qi7KCJrv3Z7PM1SMQz2FkgHMatcamkm38cq0vi/LuAneBHyYM1QCPCVP7bpR84N2Lx
         9EUx8I0/8tQm/XskJCrmExUhbfUSQ9PcPnEcTtjpbMxm/EJ29psIhlDi097OQrK+8Vav
         dXdtri9shvdn9lpq60+TzsvZ6+/wOlersqpPXplrLhH3x42gwVT2N6T7vh/qvwW8sfAz
         a+H4zgNXhPfIAy/p7FM3DQzoDiVc/XxRRePU+4LY4GXjW41H46fMmFd/0x1OBH9u1LTR
         tnBFHvrB2SaRWPWOiMFDFbwEiJFbCf5yCHioATH+3nwxr5HchlZFgbZJdJL4BqDMnWcN
         YeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018884; x=1784623684;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHa72c4+nay2FoW1wgA2FzfDfV81XjSTaeTSFxhPGw4=;
        b=YwhnJD6+HbM/v6SP3xbAELfi3J/4q8xYPmnN1Lu4rzGWhDDcj/shAQgoApVORPtM6B
         K7mUlz2EJtOu9nNzNOCarWux3OIiYkO02Rbkmotcy0kkPH8/21KCwZSvqFDJXLQd7gCT
         qRnvQYDqTRyfclDuttuB37CAX/ehyE0kxkyB+ZVC4DFbwjjaKiPyFNZuo0LZw/oHeARo
         VJB3gp8MsVL15b4/eGXJw1Sm0GZewzmTPxtlQNuO9Ix6XjrgCDCKbUSCWMV0GSCuPw7n
         Z995cHZqkRTOkI6D+8wzt1vmXZ7NtSuNkc0V1yCQNtntYz3LhzHSu1LD1wr1yH8dk5ze
         CtvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hLjQ4c20Itm8b/RoukByG/oB4JMwsoRYwqIPA+BvsAx9QNhWud4KFB05m3QryZfpTo+ckjzqqdDNcHA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwZ5KPhMGQMDY+NoKibFOnUybCA45rQUEiaI7GuqdtRoijggyVb
	hue0bMdxdKQNAvczlY5uLDqf1grFTaH59euNRgiOyV2uGMW9AVXX7euht42rAjHOV6Y=
X-Gm-Gg: AfdE7cng76ZhqxMsK1MkuKLx6QSJ1NLeJwWqkjFTCqW9Qnq9vPKq8HA3qfHZODJkj2M
	+Bx6o4fEcoGlxKlN8wueRMP0T9wOnQmhkb0TrjIPTcXV8KEj5XnJmrCTQduOZ3/wr4I6RKAprva
	VLdWFJfOSBdJsovC5fdL+nQdArbt4aeU84fEAcfHk7LS3RR3wUgsGZSpNHh6s95mHHf1CkTVYO3
	z7koN6465731irK8HDvLrL3OuDr+GbUEvyF/1VmitzsUmGm6tq61jMN45aR3oZ05XmQofMySgO4
	0Nrw7QjIO1viLtsZIA757I6lxbebUKqnaNafgzGLqqQsy4pKPv5PEzTZqMX0IWx2PeA/zJxKzoc
	0gmHn3vwugfg3RqxDiXbmrtzVsFr0+zVQ/yEO4zCXLPQfb/w/NZDi6JxOTuQbfGHUfid2bPfc49
	i7Tt64
X-Received: by 2002:a05:6830:8218:b0:7e9:dfc7:5523 with SMTP id 46e09a7af769-7ebf279d733mr6723853a34.10.1784012703208;
        Tue, 14 Jul 2026 00:05:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm14711533a34.27.2026.07.14.00.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:05:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:04:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Message-ID: <alXfl0fLlc3VrGUG@stanley.mountain>
References: <20260713170845.1518-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713170845.1518-1-alfievarghese22@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5763EC2YLMJLXKIX75MYQ5UT3UFHNTJG
X-Message-ID-Hash: 5763EC2YLMJLXKIX75MYQ5UT3UFHNTJG
X-Mailman-Approved-At: Wed, 15 Jul 2026 08:31:33 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5763EC2YLMJLXKIX75MYQ5UT3UFHNTJG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[25];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5C6F75BE62

On Mon, Jul 13, 2026 at 10:38:45PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM. This
> loses the real errno returned by the driver core and makes failures
> harder to diagnose correctly.
> 
> Return PTR_ERR(gb_tty_driver) instead so callers receive the actual
> failure reason while preserving the existing cleanup path.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

I don't have a problem with this change but the commit message
should say that tty_alloc_driver() in this case always returns
-ENOMEM so this is just a style fix and not anything which matters.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
