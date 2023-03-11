Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 584716BDBFE
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5FAF33EE23
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 4A3FE3EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:06:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=VUi3TsHS;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.41 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id e13so7516063wro.10
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxlq8/uTJgYMEbjtCGelYIUCNqfehue+4g7FgiD0hVY=;
        b=VUi3TsHSKJk/dBQ56YS4I8QSPOtNfTHud3Jgr+GSBFzLYIs/OQU96xnPGSQEzk2ONy
         sQS4StLl0uxIrZTPr1zjHT4dH/VWNuMdATbUbRcO5ydDNkQh04DPe5DX+noDalPl6VVk
         1PS3YDgqH7U3u9Qda9o7Fhucd5NZQVH/7NfrkaHFPsDEwfclBAuvLn9y/gCxHuKqKdCf
         OwwobKfMzwgez1R6W+jY2diQYIBNNuhxe2QDgEjxxE4+Ln8GQCmBsOFiiZr8z8tBsnIT
         UfV1nO5FYOsRkqPJ9jB6DlNoePqPrmkKYQfGZLb/Fyk0gfBfQk+Hq8pV4T+JeWv21uz6
         D1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxlq8/uTJgYMEbjtCGelYIUCNqfehue+4g7FgiD0hVY=;
        b=ClEDreniBOiNX0q1KkU8lpixn7Zdw62RnjVSw7FbDl1A7lZOXdBeyTzTn6Z2A5GrV1
         EDG1YdNampGmn4hDKu+JjydyirE3dy4I9uJpC8DwWOdhNY42X76lAl2TU7qGwWfcVHtP
         H8yDhK40mffJa6H0OyUL/r36DZ0oyWw5dz1v0kcD6irMYV83InruYD3zdTNH7b8bq281
         sPwYnuw+pya6bJXLHcrN4SM/6HYbvdRlr8Vsp+2Vjik3dKIcNZm8JK/zaIH1RWeGN+Hx
         Sm1vc9uUWFdu705zJPrFe/SxXYqdP55apbLRuMB/eq8lhAOIhkqxvQn17i38E7LrU0x+
         m4Xg==
X-Gm-Message-State: AO0yUKUSTgWuYUCFO/19XGLgWmRBcpBOeLJLthQ3sMIW7zgFiruBLkAK
	faJ4v9P4u5lsNIEP2q81ZO4=
X-Google-Smtp-Source: AK7set+niR6ndaQ9lj9k0Qtm+UsNN96ToRd2biC72KZoJl9ovhVyeySqVSCqIKU2nFKzshlCcPloOg==
X-Received: by 2002:a05:6000:d0:b0:2ce:a46f:bbc5 with SMTP id q16-20020a05600000d000b002cea46fbbc5mr1167439wrx.34.1678543583210;
        Sat, 11 Mar 2023 06:06:23 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b002c55551e6e9sm2547829wrt.108.2023.03.11.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:06:22 -0800 (PST)
Date: Sat, 11 Mar 2023 17:06:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4A3FE3EA3C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.41:from]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DP7G7ASU3CU333QV6ETCNKPNUR3PRLUW
X-Message-ID-Hash: DP7G7ASU3CU333QV6ETCNKPNUR3PRLUW
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:54 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DP7G7ASU3CU333QV6ETCNKPNUR3PRLUW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 03:59:19PM +0200, Menna Mahmoud wrote:
> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
> 
> Reported by checkpath.
> 
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
> 
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---

This breaks the build.  You need to compile the code before sending a
patch.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
