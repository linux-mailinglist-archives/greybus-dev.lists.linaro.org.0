Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBE68154D
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 16:42:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E6473F334
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:42:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 2926F3E8ED
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 15:42:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of wei.liu.linux@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=wei.liu.linux@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kernel.org (policy=none)
Received: by mail-wr1-f49.google.com with SMTP id a3so4785821wrt.6
        for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 07:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUbT8GW2Xe7TYWK+SBC453IgVa+1sYQmDI5rwmFeFNw=;
        b=EcgcRnWJb+0Uf5oAyplevwH1WjuxOhiyVhWz0VL77xUJfWVzK86eWqbrA5dpz4Glr3
         koKi8OcvZR4uQ46vZ8Tp/Xfu30BrvMYXhNnAXXpTFw45Px4hr/14F06okHyCiZNEYv1Z
         nwy27kHZkPzmjH/3rg2YOMR6gfG+0iqRvv0t527f5PEbl+Gh+0BX/ae9wlBVtBRjcZYU
         tnU4QdRWi08u50mw8LfgMdZIeZy2/UkCI27cCxbvJP81bjwvfNmXSS7Lpye2ODouAU0E
         WZVDDv1rUeSXy3h/B1oWuVBTBOXsVWeyB5TWczihXFHRn7SVUzd24O3L+V89LtLhAD35
         +xuQ==
X-Gm-Message-State: AO0yUKUMRfTS2EI2+Wa8CV+MVEHeQlVaXQ0kfg+WhmSOdQmK9C9qZ0ac
	aaiwI9QSXewvHv8f3rBUPbc=
X-Google-Smtp-Source: AK7set9bilzV+cycilUvhPXZZQ4RW9LvqXB3OMkaS0/xxipVSHC82hgRy+Gvk8bq1qBYOdHHuQZcdA==
X-Received: by 2002:a05:6000:609:b0:2bf:d14a:21dd with SMTP id bn9-20020a056000060900b002bfd14a21ddmr16045718wrb.29.1675093331155;
        Mon, 30 Jan 2023 07:42:11 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b002be53aa2260sm13482929wrs.117.2023.01.30.07.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:42:10 -0800 (PST)
Date: Mon, 30 Jan 2023 15:42:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Message-ID: <Y9flUYVZBWXwdZfk@liuwe-devbox-debian-v2>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-2-3fc282b3b1d0@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130-hid-const-ll-driver-v1-2-3fc282b3b1d0@weissschuh.net>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2926F3E8ED
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.221.49:from];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[wei.liu@kernel.org,weiliulinux@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), No valid DKIM,none];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.49:from];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.sourceforge.net,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[51.145.34.42:server fail];
	TAGGED_RCPT(0.00)[];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.liu@kernel.org,weiliulinux@gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: ZT2GLPNMFZYYP4JJ3HG7OH4Q2WZF4RO3
X-Message-ID-Hash: ZT2GLPNMFZYYP4JJ3HG7OH4Q2WZF4RO3
X-MailFrom: wei.liu.linux@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/9] HID: hyperv: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZT2GLPNMFZYYP4JJ3HG7OH4Q2WZF4RO3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 03:59:38AM +0000, Thomas Wei=DFschuh wrote:
> Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
> the lowlevel HID drivers are only exposed as const.
>=20
> Take advantage of this to constify the underlying structure, too.
>=20
> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
