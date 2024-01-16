Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121A82E934
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 06:38:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0745F40B37
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 05:38:56 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lists.linaro.org (Postfix) with ESMTPS id 4F7FD3EF1D
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jan 2024 05:38:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="J1jKz/LM";
	spf=pass (lists.linaro.org: domain of viresh.kumar@linaro.org designates 209.85.160.45 as permitted sender) smtp.mailfrom=viresh.kumar@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-206b77b9f4bso3495968fac.1
        for <greybus-dev@lists.linaro.org>; Mon, 15 Jan 2024 21:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705383532; x=1705988332; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7yUFUU66f8Pu7tZiWG2Vaq0nR6vJICcLg6Vq70eDraI=;
        b=J1jKz/LMBo1XnHMLEpkeWhwFoBqBL9Nc8UYe9W5ugOEenD4IvpPaWG3GxZWPhJQDbS
         R0lHeWFnHTqgATvbfGduFSs4BOlqFx7YmjfkbDjJocEbrhiIg8Z4nvSAGGNrZaDZicg2
         dZwZTegAALl6V35ybjIUStT4pdBUmAwDJtTbEGADvp+XUq1dqHbC+3poJaIdTj5T5PVe
         PJpsOOqYSLPCdaR55n7n1kykW72V53uPwiPbfJr6servDyAE/JgZ3q8LFaMEntV5r3Xm
         Yjx8c/+eUh/tsBu/UH1+IOHTpp/C0kqz/dqlU2xDgZRJRd/qrDC3GLRofsqipVubIAWh
         Ynhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705383532; x=1705988332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yUFUU66f8Pu7tZiWG2Vaq0nR6vJICcLg6Vq70eDraI=;
        b=Arjw65JIQpZlze/lULuxfEAGjzVtzSE8fkyzUAaU35vCGzqjidpgPH482ZlpQSSiV+
         pTQ440UCnBgATImZCNIsaMTYj5dIkS8zQqiq4RusNjuX13uRA0NOF+7xmu4yQBqHYFWU
         AqSPIGvrwqhXyPgxXnvWNNaHeLIv9PzJdkU8PzbDbJOi460n3JeoZJ2A/CKGn3bKlJDy
         KV+tTDswE8Ucl+8855mMPzwUlOfH9sD/7JtumtHjCJoCetPRaxaWHWtk/FnX5xog6hJI
         4uAQOs15JswwVHeeEjvub3BGFq/S8zw2uohIh0rR5k4gt0Y5FWGZBA3k28jf2XAQEaNx
         znBQ==
X-Gm-Message-State: AOJu0Yy+1jcvxL/8Ilo4XywwbZei5yRvA3YmKALBzuAyZiGt8Bg9OUqP
	ShJGRdB9qO+5xXycuL5ZFMjMU34sG8Qh4oGb
X-Google-Smtp-Source: AGHT+IEfDKhikqk0PQDjlpmEeKuxVyvTuSVywSGF6JHipf9nnyT0gOg1FuJ6LMT4BnZJjbrWRG40Jg==
X-Received: by 2002:a05:6870:414b:b0:205:ccc5:2740 with SMTP id r11-20020a056870414b00b00205ccc52740mr10523146oad.10.1705383532496;
        Mon, 15 Jan 2024 21:38:52 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id n9-20020a6563c9000000b005c21c23180bsm7951734pgv.76.2024.01.15.21.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 21:38:51 -0800 (PST)
Date: Tue, 16 Jan 2024 11:08:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20240116053849.ymahw5hzwmtsqglh@vireshk-i7>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
 <188f907d08d4a57d1058f01bc4939f209a4c8e43.1705348270.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <188f907d08d4a57d1058f01bc4939f209a4c8e43.1705348270.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.45:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,vger.kernel.org,pengutronix.de,gmail.com,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4F7FD3EF1D
X-Spamd-Bar: ------
Message-ID-Hash: E74236VDXBIX7CKBJEVY7TZBHJUMF3UA
X-Message-ID-Hash: E74236VDXBIX7CKBJEVY7TZBHJUMF3UA
X-MailFrom: viresh.kumar@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-spi@vger.kernel.org, kernel@pengutronix.de, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 26/33] staging: greybus: spi: Follow renaming of SPI "master" to "controller"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E74236VDXBIX7CKBJEVY7TZBHJUMF3UA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 15-01-24, 21:13, Uwe Kleine-K=F6nig wrote:
> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions and struct members were renamed. To not break all drivers
> compatibility macros were provided.
>=20
> To be able to remove these compatibility macros push the renaming into
> this driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/greybus/spilib.c | 66 ++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 33 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

--=20
viresh
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
