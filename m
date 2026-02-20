Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHG/A4cWmGki/wIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:08:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0116585F
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:08:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E7E4401F8
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:08:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id AF4573F7F2
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 08:08:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=nFDd2Zhy;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4833115090dso16664825e9.3
        for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771574914; x=1772179714; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW5/Tx2f7vm6B1RaJRWVO1XGu49Vd/tH4yy2gBO2bc0=;
        b=nFDd2Zhy4bABwlzTpXvtIhrdFtUA79GHFrkg09bekmNLXWptqU2jx3cvVr7ECqyMfn
         Bm62G0eZh1UZw/RczhYnPbHRkRYZcgA389SsTG2OI0rlWSZ4FUB7/WOAWyEH+mujBqWf
         Fvqrg+Axx25RZEfd0CEcNv5MSFJ9O8IakLZ+NuHNFVrork1OiXw9cL0PzxBpljPWszap
         cAk0JrG6GMs1Iw67Mj/gMHJv7wSaPQJW0jyo/BKOZdKQCNHU+1RSixlAMci3VtqT273d
         h24sAuXw/kCdVU+aGPbqdTeyPul1o9gzgn6TQf0UWqJ/IoRMpUeiUglPFnYidUKbJkOS
         LW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771574914; x=1772179714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW5/Tx2f7vm6B1RaJRWVO1XGu49Vd/tH4yy2gBO2bc0=;
        b=D8XhCuOb5GgQRa/3Zkv6qtCU1A87AxGyCuBNKGK4W9b5YwZMPHz/GN2bSgcHfrBtg5
         YZczNeUsPTYnhHMKvgvZ55kGaju+W3tq+Y8dCuCzPV9VEn61Ze5knx20H0GgSnsG0ewW
         txqjNP1AIUxdsOrsRDVe+aMYah4J719T2Zk0Ip+DBKCpO9a+tiTZS4oWp7Ms8Ha6Me12
         9+5unyJ7E9meSjimPOHBwv95hTiXohYNybK8lUWSWQD9ZkXOPkXX3txQ2Rb6XDfPoV7x
         recOn0tfpLT6RdS32/j6WRCGmBs1rvDUedmhecyjH9wA5IEWUo6uNE1QXqhYueLX2EbY
         IpYA==
X-Forwarded-Encrypted: i=1; AJvYcCVXm+7DK5si3mRSIEmXAgq5sjKOG6dgUIRaFj08KuQ5S58h/XehqwlgsKYseBVoqdQWsy9djcjOATvqGQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyxkcrrR2bkfgaHceO8fzLeSqGoobzA5uSp8v5t1B2oLcMzGjla
	xVblWyQoyekl33qsZzq96+OJLt8/n9Zr5wzKuSPyReI70+IZdoMwlTBCmvZ3/ZrUxuee2A==
X-Gm-Gg: AZuq6aKgC5/nCjEFRNNwMDS39hfC8nIC2GmZGrR2wSkasWI0EIHPpBXxagu3kv6QIPD
	e3/Vg0Q4CHxwJXSbDyTiYnKxdW8Wzx/rdcdGkfKLuKWfFN/CEd9lY+i0UGshp5jL6hBCIWc9e5e
	Z8X1thg9qrFTYcBxlx5+iMvGpmtMOqhtypCF88ufdKeeD3Nzht9BuoCLbfpEWPEax/JuhJjXvJc
	JD9z0Qjb26d69mj+B/idUIjYBszIEk/VjnzUbBTxPNgQ6loHW8EApSowldcJH0Fcb+oHb+2kAhp
	xja3T0S5p1ILmwYoq+XkV0icGnT4gHN8zdQjwM1ZEsdq8LVf6oHxyc4uFNKAruViUKblKl0kr3L
	f4BF9IxYb8v4vMx4VWfkRv1a7SyjHESQ9N6HdeiLNfI65h0fOt2ELi4xJHcOvcxoBstgF7pysFS
	/WwiHo2IeBNuQGlpnpcXWRpBSZqUcv
X-Received: by 2002:a05:600c:1c20:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-48398a549ccmr139543985e9.13.1771574913565;
        Fri, 20 Feb 2026 00:08:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm59429125e9.7.2026.02.20.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:08:33 -0800 (PST)
Date: Fri, 20 Feb 2026 11:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <aZgWffV8wwa3MDW1@stanley.mountain>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
 <20260220062741.399677-2-hardik.phalet@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220062741.399677-2-hardik.phalet@pm.me>
X-Spamd-Bar: ---
Message-ID-Hash: ZQ6IHGIYBGTNWU224MWCFRGMHXSBVHIY
X-Message-ID-Hash: ZQ6IHGIYBGTNWU224MWCFRGMHXSBVHIY
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZQ6IHGIYBGTNWU224MWCFRGMHXSBVHIY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.245];
	DKIM_TRACE(0.00)[linaro.org:-];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 71E0116585F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> can return NULL when the requested id does not exist. The returned
> pointer is dereferenced unconditionally via kobject_get(), leading to a
> NULL pointer dereference.
> 
> Only take a kobject reference when the module is found.
> 
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>  drivers/staging/greybus/audio_manager.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 27ca5f796c5f..1da8804e61ca 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)

I don't think this gb_audio_manager_get_module() function is ever
called.  If it is then we need a Fixes tag.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
