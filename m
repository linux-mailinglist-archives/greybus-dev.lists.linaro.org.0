Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCEA8710F5
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Mar 2024 00:10:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C5BD4402E
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 23:10:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by lists.linaro.org (Postfix) with ESMTPS id EF1CA3F37E
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 23:10:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=chromium.org header.s=google header.b=DQNHnJpa;
	spf=pass (lists.linaro.org: domain of keescook@chromium.org designates 209.85.216.42 as permitted sender) smtp.mailfrom=keescook@chromium.org;
	dmarc=pass (policy=none) header.from=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-299b818d63aso3695729a91.0
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 15:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709593840; x=1710198640; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9msUTwBa3XNDAwjjPAvGjEpS0Gd3hVi8Z81nRq0fsvc=;
        b=DQNHnJpaFnsbOig0/Bm1MtStcyZSoFK7y5PILxrTrd7bDbVZq3iyHHQVwTI/+90CP5
         wMvpvNInf0Czj8e5gQTc3jJJYvDFMQF9JDhyYM+70GGrM6RF0r6xWU5Lyjq7+e6lsO0l
         q9uxKidcvAr8nfc4nOKsZxBgpbP/aFU5+VwuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709593840; x=1710198640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9msUTwBa3XNDAwjjPAvGjEpS0Gd3hVi8Z81nRq0fsvc=;
        b=S/tHv6Fr8O3K6TriLs7akB7gHqR5mamMjtT2ZeORzkCg48sRi/E0OzUxulolN48q7u
         i6tkSQl86GCfRN2G97u3yK7iLMHvhwxPrQboHizesdVWn/qTqeWWzpWdgRKZDFA53Ees
         ze5uKYAgGGgRxJxTXkPcIRhj7iQ9WjLL89N3y6bt2w1Sm4CrEbszsPpMPo98ORv9vKoK
         lqF1l2BaYP55McuEckZG5g96ij8jFDO0apbqXEjezQ+Lohz4fD2tjsYq2bdRaai/NX4v
         tznX6ROeSwAcMwvzbUrj6D0x6W7ClVUMyOak0v4wkaFB9VYZd8T6trlRhJCofr5noIOo
         Uqgw==
X-Forwarded-Encrypted: i=1; AJvYcCXd/41d6PSh6Rfmg3sm5m9a1K0o60EsEqbTV2dcR0QeXPE2TgEf/Az1Q6cXlm80bUIIj8iMeGwLioJ5AJSfgHbzpla41rx5963zhjDn
X-Gm-Message-State: AOJu0YwrgT3Qpfa97m9+0dYFXX9t9UvUf8CcdgG7FWrSprtt8CS2JLWv
	nL9PYN0ccBpnp3haGtQQMEu9ELPRdttYh1+G1zjIO6H1BynLXURSE9cTZqdboA==
X-Google-Smtp-Source: AGHT+IEbAr3Hucp75eD8JSPbmT5fSEjkHtUZ6q2D8D6DXvd41jaoEyXkI1zB44xifF8tsNHZEQjQpA==
X-Received: by 2002:a17:90a:e548:b0:29b:1bc5:cfda with SMTP id ei8-20020a17090ae54800b0029b1bc5cfdamr1080411pjb.16.1709593840120;
        Mon, 04 Mar 2024 15:10:40 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa13-20020a17090af0cd00b00298f2ad430csm8380840pjb.0.2024.03.04.15.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 15:10:39 -0800 (PST)
Date: Mon, 4 Mar 2024 15:10:39 -0800
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <202403041507.BEF59739@keescook>
References: <20240304211940.it.083-kees@kernel.org>
 <1c5ab1e7-ac66-438c-bc49-0785810e9355@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c5ab1e7-ac66-438c-bc49-0785810e9355@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EF1CA3F37E
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.42:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+]
Message-ID-Hash: VJUNIBJSMRPWUX7YHQ6T6EMWQSUW2K36
X-Message-ID-Hash: VJUNIBJSMRPWUX7YHQ6T6EMWQSUW2K36
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VJUNIBJSMRPWUX7YHQ6T6EMWQSUW2K36/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 04, 2024 at 04:45:11PM -0600, Alex Elder wrote:
> On 3/4/24 3:19 PM, Kees Cook wrote:
> > FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> > code base has been converted to flexible arrays. In order to enforce
> > the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> > destinations need to be handled. Instead of converting an empty struct
> > into using a flexible array, just directly use a pointer without any
> > additional indirection. Remove struct gb_bootrom_get_firmware_response
> > and struct gb_fw_download_fetch_firmware_response.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for adding the comments!  This looks good to me.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>
> 
> 
> 
> I want to call attention to a few other spots that should
> get a little more attention--related directly to what you're
> doing here.
> 
> I noticed that the GB_CONTROL_TYPE_GET_MANIFEST response
> structure also contains only a flexible array.  It might
> be good to add a similar comment in gb_interface_enable(),
> above this line:
>         manifest = kmalloc(size, GFP_KERNEL);
> The definition of the gb_control_get_manifest_response structure
> could probably be replaced with a comment.
> 
> 
> The response buffer for an I2C transfer consists only of incoming
> data.  There is already a comment in gb_i2c_operation_create()
> that says this:
>         /* Response consists only of incoming data */
> The definition of the gb_i2c_transfer_response structure should
> then go away, in favor of a comment saying this.
> 
> The response buffer for a SPI transfer consists only of incoming
> data.  It is used three times in "driver/staging/greybus/spilib.c":
> - calc_rx_xfer_size() subtracts the size of the response structure,
>   and that should be replaced by a comment (and the structure
>   definition should go away)
> - gb_spi_decode_response() takes the response structure as an
>   argument.  That could be replaced with a void pointer instead,
>   with a comment.
> - gb_spi_transfer_one_message() is what passes the response buffer
>   to gb_spi_decode_response(), and could be adjusted to reflect
>   that the response consists only of data--rather than a struct
>   containing only a flexible array.
> 
> 
> Kees:  I'm *not* asking you to deal with these, I'm just mentioning
> them to you.  My comments above (without someone else confirming)
> are not sufficient to dictate how to address these.

Okay, thanks! Yeah, I took a look at struct gb_i2c_transfer_response and
I think it might trip the memcpy checking too since it's zero sized, but
it's on the source side, which isn't as strictly checked.

I'll add a TODO item to track these, though.

-Kees

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
