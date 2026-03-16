Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHAoO8Cwt2l3UQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:26:56 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2C295952
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:26:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3EAE83F790
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 07:26:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	by lists.linaro.org (Postfix) with ESMTPS id 88A903F70C
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 07:26:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=hO8ZT2n4;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.44 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-485345e1013so37164895e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773646012; x=1774250812; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNq4xW0J3bXHmWOG372MrFQGECFj/5A4bz1BA7Mwpfo=;
        b=hO8ZT2n4Jxl3XO1uggGmlKK9+e5GUrOWdH6v7nnhJ3j4Ri57A6ZZ1IzaLCBV6zYjxh
         if+zJygpzNXcji4DvdXAA4EaMk0MOsTJltO36HoEcIcJWjcVicEGw2oitg4AfeC30leK
         8p0hwNpNWqliiCjy327u1KqpKPGGinJ9HNQHiXc4wZGB808FAgF0oLbpRSi4vY/noLzt
         gYunCtZQmpj3T8xczNVQEB9lXpeiGh5zjec1gNib6vHhzjwEX0zKXxr8EuxqXXbosxvm
         3onKjfMkLWFXjdIQnsM5iwvfFb3wNmlN1HIKxUfTCosAzREJr3FaII/GFUvmsQDIkcxr
         S1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646012; x=1774250812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNq4xW0J3bXHmWOG372MrFQGECFj/5A4bz1BA7Mwpfo=;
        b=PD5PgvGWUNqF9tOjIzskVF8CRGAxun0JnfsvZk+X5QWkTHfwzl2N5vj0k15pmbQ61h
         KH/NDGtFddaM7BpQvfmGh6Qs3QsW9q1Mt2/rZBW/hgiYmlGV7QEDn1v8qVc6kSNQSq2O
         ZcnlhRfDVcc7yAQQqpt4YTiX3Mdtg+xrf25hk3rBkUJ1orGbdc3tsT1v+/jDbG7BgnTX
         wlMf9ohh/YYMMAjELqt68MqHDnYc8Y7dNujmQAV7Qo/JIbBA/YM2SgxetNv/ont02Coy
         OAdrIPYzb+buoPwE0cx4TTNOpxd9M6A6BJwaVOyROIUuYU/4t28X6328tRi8Bfj8Eedr
         EqAA==
X-Forwarded-Encrypted: i=1; AJvYcCVFFRpowipT3XP711fjgvvmL1rf3YyZf3saWZD7U2J+itYzEEESty3kQBjWU/w3XDK3hZm+jWBzLKUyNQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx6dKkCaE48KJHog+z4JRD4p3jGhSz90a0kJRkCQI2m1qWRzUCi
	gI/FgkTdqsaiUweJr6HfeNW6EyJ3w2s5Kf3AzHT3+xS9hujhYwfgPOIYAOrChhg/IAZgVQ==
X-Gm-Gg: ATEYQzyV5A63sxZ3dtmnYtMpsBK4zYyWBkV8fVzhCfpq3KpiAQpFRpjfFx4N3ETzmSR
	BhhGmcINY6iYljRcHVLwJEiicmRKNgATMx4TWjihpFacGmfmDwVsXTXxqtMQ4fuRL9CD68kbyXR
	MS0Ygy4rli9hkzByE+4qsI9uMu9k7Ngjl7B8YzC6AOJ9rp3tz+GN0z1cgQox4s2OVtFejrw6F2i
	ISNdlb+2I2J7ggN24jxWLQDCRdOdZbcVNfwK4jV9pQ/yN7aYxwNY5LKSs5TJ8EAlpOZrKOwM6M2
	7LqiSRUTuHfO8bBsnlTm14pAPA46uSY1V81H53IwT5BpjlTP6TMo1FweUwQTLWqBvLMB5tvUIC5
	dQMWs1OXPTpb56jNGKZnhFkrzthdxOJOQ5KBTye6RvUdJOweczl2USQaB6hY/nfvla9VMiznPKD
	zXycKci9creL0AQBaKqQlYFRaOraGxIeqeHuTsQ6Q=
X-Received: by 2002:a05:600c:3e05:b0:485:3428:774c with SMTP id 5b1f17b1804b1-48555ab09e1mr173821375e9.4.1773646012257;
        Mon, 16 Mar 2026 00:26:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm142383565e9.4.2026.03.16.00.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:26:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:26:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <abewuKnDKzUEt25I@stanley.mountain>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311212511.82563-1-damien.riegel@silabs.com>
X-Spamd-Bar: ----
Message-ID-Hash: FFX7ISOYFHHZI5U2WGR54FFUVFF4XLLM
X-Message-ID-Hash: FFX7ISOYFHHZI5U2WGR54FFUVFF4XLLM
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2 RESEND] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FFX7ISOYFHHZI5U2WGR54FFUVFF4XLLM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
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
	NEURAL_SPAM(0.00)[0.303];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 5CA2C295952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 05:25:10PM -0400, Damien Ri=E9gel wrote:
> This addresses a use-after-free bug when a raw bundle is disconnected
> but its chardev is still opened by an application. When the application
> releases the cdev, it causes the following panic when init on free is
> enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy):
>=20
>     [   78.451062] refcount_t: underflow; use-after-free.
>     [   78.451352] WARNING: CPU: 0 PID: 139 at lib/refcount.c:28 refcount=
_warn_saturate+0xd0/0x130
>     [   78.451698] Modules linked in: gb_raw(C)
>     [   78.451881] CPU: 0 UID: 0 PID: 139 Comm: raw_chardev_tes Tainted: =
G        WC          6.18.0-rc4 #212 PREEMPT(voluntary)
>     [   78.452386] Tainted: [W]=3DWARN, [C]=3DCRAP
>     [   78.452560] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>     [   78.453049] RIP: 0010:refcount_warn_saturate+0xd0/0x130
>     [   78.453311] Code: 0b 90 90 c3 cc cc cc cc 80 3d 4f ec 1d 01 00 0f =
85 75 ff ff ff c6 05 42 ec 1d 01 01 90 48 c7 c7 e8 5b cb b4 e8 31f
>     [   78.453953] RSP: 0018:ffffaa0f80203ed0 EFLAGS: 00010282
>     [   78.454251] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000=
00000000000
>     [   78.454472] RDX: 0000000000000000 RSI: ffffaa0f80203d68 RDI: 00000=
000ffffdfff
>     [   78.454690] RBP: 00000000040e001f R08: 00000000ffffdfff R09: fffff=
fffb510c008
>     [   78.454899] R10: ffffffffb505c060 R11: 0000000063666572 R12: ffff9=
38dc210b468
>     [   78.455279] R13: ffff938dc1f5e1a0 R14: ffff938dc14710c0 R15: 00000=
00000000000
>     [   78.455549] FS:  00007f2f22741740(0000) GS:ffff938e11fbc000(0000) =
knlGS:0000000000000000
>     [   78.455806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   78.456129] CR2: 00007f2f228c89c3 CR3: 00000000020d0000 CR4: 00000=
000000006f0
>     [   78.456786] Call Trace:
>     [   78.456936]  <TASK>
>     [   78.457069]  cdev_put+0x18/0x30
>     [   78.457230]  __fput+0x255/0x2a0
>     [   78.457372]  __x64_sys_close+0x3d/0x80
>     [   78.457544]  do_syscall_64+0xa4/0x290
>     [   78.457697]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     [   78.457883] RIP: 0033:0x7f2f227d1cc7
>     [   78.458097] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 =
00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
>     [   78.458692] RSP: 002b:00007fffab36fb50 EFLAGS: 00000202 ORIG_RAX: =
0000000000000003
>     [   78.459155] RAX: ffffffffffffffda RBX: 00007f2f22741740 RCX: 00007=
f2f227d1cc7
>     [   78.459400] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000=
00000000003
>     [   78.459648] RBP: 00007fffab36fba8 R08: 0000000000000000 R09: 00000=
00000000000
>     [   78.459899] R10: 0000000000000000 R11: 0000000000000202 R12: 00005=
58298427128
>     [   78.460212] R13: 00007f2f227416d0 R14: 00005582c72cf320 R15: 00005=
582c72cf320
>     [   78.460470]  </TASK>
>     [   78.460571] ---[ end trace 0000000000000000 ]---
>=20
> The cdev is contained in the "gb_raw" structure, which is freed in the
> disconnect operation. When the cdev is released at a later time,
> cdev_put gets an address that points to freed memory.
>=20
> To fix this use-after-free, convert the struct device from a pointer to
> being embedded, that makes the lifetime of the cdev and of this device
> the same. Then, use cdev_device_add, which guarantees that the device
> won't be released until all references to the cdev are not released.
> Finally, delegate the freeing of the structure to the device release
> function, instead of freeing immediately in the disconnect callback.
>=20
> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> ---
> resend: added linux-staging as Cc, this list was not part of the first
> submission.
>=20
>  drivers/staging/greybus/raw.c | 49 +++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 71de6776739..b92214f97e3 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -21,9 +21,8 @@ struct gb_raw {
>  	struct list_head list;
>  	int list_data;
>  	struct mutex list_lock;
> -	dev_t dev;
>  	struct cdev cdev;
> -	struct device *device;
> +	struct device dev;
>  };
> =20
>  struct raw_data {
> @@ -148,6 +147,13 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, =
const char __user *data)
>  	return retval;
>  }
> =20
> +static void raw_dev_release(struct device *dev)
> +{
> +	struct gb_raw *raw =3D dev_get_drvdata(dev);
> +
> +	kfree(raw);
> +}
> +
>  static int gb_raw_probe(struct gb_bundle *bundle,
>  			const struct greybus_bundle_id *id)
>  {
> @@ -168,11 +174,14 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  	if (!raw)
>  		return -ENOMEM;
> =20
> +	device_initialize(&raw->dev);
> +	dev_set_drvdata(&raw->dev, raw);
> +
>  	connection =3D gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
>  					  gb_raw_request_handler);
>  	if (IS_ERR(connection)) {
>  		retval =3D PTR_ERR(connection);
> -		goto error_free;
> +		goto error_put_device;

"raw" isn't freed on this error path because we haven't
assigned "raw->dev.release =3D raw_dev_release;".

regards,
dan carpenter

>  	}
> =20
>  	INIT_LIST_HEAD(&raw->list);
> @@ -187,29 +196,26 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  		goto error_connection_destroy;
>  	}
> =20
> -	raw->dev =3D MKDEV(raw_major, minor);
> +	raw->dev.devt =3D MKDEV(raw_major, minor);
> +	raw->dev.class =3D &raw_class;
> +	raw->dev.parent =3D &connection->bundle->dev;
> +	raw->dev.release =3D raw_dev_release;
> +	retval =3D dev_set_name(&raw->dev, "gb!raw%d", minor);
> +	if (retval)
> +		goto error_remove_ida;
> +
>  	cdev_init(&raw->cdev, &raw_fops);
> =20
>  	retval =3D gb_connection_enable(connection);
>  	if (retval)
>  		goto error_remove_ida;
> =20
> -	retval =3D cdev_add(&raw->cdev, raw->dev, 1);
> +	retval =3D cdev_device_add(&raw->cdev, &raw->dev);
>  	if (retval)
>  		goto error_connection_disable;
> =20
> -	raw->device =3D device_create(&raw_class, &connection->bundle->dev,
> -				    raw->dev, raw, "gb!raw%d", minor);
> -	if (IS_ERR(raw->device)) {
> -		retval =3D PTR_ERR(raw->device);
> -		goto error_del_cdev;
> -	}
> -
>  	return 0;
> =20
> -error_del_cdev:
> -	cdev_del(&raw->cdev);
> -
>  error_connection_disable:
>  	gb_connection_disable(connection);
> =20
> @@ -219,8 +225,8 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  error_connection_destroy:
>  	gb_connection_destroy(connection);
> =20
> -error_free:
> -	kfree(raw);
> +error_put_device:
> +	put_device(&raw->dev);
>  	return retval;
>  }
> =20
> @@ -231,11 +237,9 @@ static void gb_raw_disconnect(struct gb_bundle *bund=
le)
>  	struct raw_data *raw_data;
>  	struct raw_data *temp;
> =20
> -	// FIXME - handle removing a connection when the char device node is op=
en.
> -	device_destroy(&raw_class, raw->dev);
> -	cdev_del(&raw->cdev);
> +	cdev_device_del(&raw->cdev, &raw->dev);
>  	gb_connection_disable(connection);
> -	ida_free(&minors, MINOR(raw->dev));
> +	ida_free(&minors, MINOR(raw->dev.devt));
>  	gb_connection_destroy(connection);
> =20
>  	mutex_lock(&raw->list_lock);
> @@ -244,8 +248,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundl=
e)
>  		kfree(raw_data);
>  	}
>  	mutex_unlock(&raw->list_lock);
> -
> -	kfree(raw);
> +	put_device(&raw->dev);
>  }
> =20
>  /*
> --=20
> 2.52.0
>=20
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
