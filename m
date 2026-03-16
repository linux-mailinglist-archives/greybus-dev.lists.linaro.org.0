Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHDuLSCzt2nUUQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:37:04 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F42295B9A
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:37:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37C4E3F751
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 07:37:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 153A43F70C
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 07:37:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=vvp4w8xy;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.41 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853aec185aso34488675e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773646620; x=1774251420; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8R5+6xWTjhUsYZA5f4QhM5GoODRRoehXbOY+MUE7yc=;
        b=vvp4w8xy3aR7lG6CbiV6Rbo4K6TvTpkggK34LdXtfLYCdPeMQ8DrTRO5bdAZCvolel
         IZJvdgbciq93WF1QpT9J11+vq/2jv3jE06l4ET9ofIvOi6H2uvVqmjfMTsMGAcg4CPzH
         ZWbvqiF6OHJqGKrhXmA6bStKOKglEixmYLAx3h/KvAaH9OZ8iv67cnhLbZuliWve66YS
         UBacBpEe28qHEt+cyx6eC8fJKOVt4mvJP5UJjwEAabS+9BHEk3RnRbyPBiyvOAijmClU
         5XZv0SvYsAExg1pI5eBuR/79tbXrFOUTR3ygCJSlxj2nEYSkuJHdKvVVZEgfLL8Hx3pJ
         hapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646620; x=1774251420;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8R5+6xWTjhUsYZA5f4QhM5GoODRRoehXbOY+MUE7yc=;
        b=QfI98ft/Ix2S5obypuW57mJsbZMh5C9jwCjN+ea24u/xb1kb/v75I2T5WIfiLF6n2R
         Z3/tKb+wh+rbqHf23bnmj2Rh2Rf5+WBycwFe0jV1d6UM1Gq53FFkBNLT0c666SZEKyeN
         QMA/3YTCpt/TGgr1MlEu38EJ0VrRZCF9vEy1d+UmKqbMskyFUGnoDWXRkBG2unI3MXxw
         mGm1dgxdg45Nytpjlqy6eUM6ooy2fzmX20wX32uKe88CxsY8eUFztfL6tGXAe9R8VT6B
         V4wY2rAJ0rbcAfS5C6w63EiWbg19CJ4DOpuwaIGL9mw5A7I5VGawYP/MQWOU9T5VpNY3
         J+pw==
X-Forwarded-Encrypted: i=1; AJvYcCXCzlJHKn2CBsHB+ShUdhwS6ZOGnaag96w4q3qPJzLH9630QLwZD3/AfrPf+uNaXEO7X6178osVL5GGhw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzbEXpkE3JhwuNj8XEsaKNn4qSFjFEUHWf63WupDMMgLEOTdgOh
	zn+GWu+CZzkwkyCATbgogwsJmjZW0ZvW7Ip2/MAG6W4pqBYEZN42ss3pSayaS1EQPh4OMg==
X-Gm-Gg: ATEYQzzuJ0xj7a6cuEmj4ves0FO+f2C7MEkrgQoH7stzNR32RtpEWbS/MgZfPbstgQV
	ZKyosJ/ap8fILto+CaAF4OtwLTuUSu40fhlZDZM9ICkl6VpQfDAlQuI5NmcFrtuD5Q38AMWZCKp
	p76urDZSd6hVii18MXRW8BhDPUeirh/UVi9f7edelaZ6ln8ssssOEKt4PPYRpAr9FfkNLXxT8mQ
	d+IDfWT1AhDSLQxeeZWANB4GVPOFnAXHflpQjDlOC7MsQ/kZbblkRrLwl4VUyjGNJiAsM/XYPHH
	ZsbJVNQOSVhpfeOxm51jFe5yQCp6I+BEiE5IWtqnBzd0jBHKxYcGsgHWfrL3lfwfguOzNMaJtQ5
	DTuifItFhN6eIHhrYsYrPX9Ok05OJc5Yy8fElspnyG/IMkdhB+0xniGfdk+OZNyOqoUhKEvrN1D
	+9wQCk742L5MCBVKmXlu6pIQHkD13V
X-Received: by 2002:a05:600c:4fc6:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-485566d520cmr183873595e9.12.1773646619872;
        Mon, 16 Mar 2026 00:36:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6c24sm373669035e9.5.2026.03.16.00.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:36:59 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:36:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <abezGG0LODIA4SZS@stanley.mountain>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311212511.82563-2-damien.riegel@silabs.com>
X-Spamd-Bar: ----
Message-ID-Hash: UKIX45NYJ6VCU5WPY6ZT5YRPMGZR2WQI
X-Message-ID-Hash: UKIX45NYJ6VCU5WPY6ZT5YRPMGZR2WQI
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UKIX45NYJ6VCU5WPY6ZT5YRPMGZR2WQI/>
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
	NEURAL_SPAM(0.00)[0.246];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qemu.org:url,lists.linaro.org:helo,lists.linaro.org:rdns,silabs.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 52F42295B9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 05:25:11PM -0400, Damien Ri=E9gel wrote:
> If a user writes to the chardev after disconnect has been called, the
> kernel panics with the following trace (with
> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy):
>=20
>     [   83.828726] BUG: kernel NULL pointer dereference, address: 0000000=
000000218
>     [   83.829288] #PF: supervisor read access in kernel mode
>     [   83.829528] #PF: error_code(0x0000) - not-present page
>     [   83.829828] PGD 0 P4D 0
>     [   83.830126] Oops: Oops: 0000 [#1] SMP NOPTI
>     [   83.830753] CPU: 0 UID: 0 PID: 140 Comm: raw_chardev_tes Tainted: =
G         C          6.18.0-rc4 #212 PREEMPT(voluntary)
>     [   83.831260] Tainted: [C]=3DCRAP
>     [   83.831426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>     [   83.831912] RIP: 0010:gb_operation_message_alloc+0x14/0xc0
>     [   83.832366] Code: 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90 =
90 90 90 90 90 90 0f 1f 44 00 00 41 56 4c 8d 72 08 41 55 41 89 cd1
>     [   83.832979] RSP: 0018:ffffb73f0027bd58 EFLAGS: 00010286
>     [   83.833247] RAX: ffffa44741f72300 RBX: ffffa44741f72300 RCX: 00000=
00000000cc0
>     [   83.833513] RDX: 000000000000000a RSI: 0000000000000002 RDI: 00000=
00000000000
>     [   83.833732] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 00000=
00000000000
>     [   83.834044] R10: ffffa44741f72300 R11: 0000000000000000 R12: 00000=
00000000002
>     [   83.834267] R13: 0000000000000cc0 R14: 0000000000000012 R15: 00000=
00000000000
>     [   83.834533] FS:  00007fead7859740(0000) GS:ffffa447a31bc000(0000) =
knlGS:0000000000000000
>     [   83.834776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   83.834974] CR2: 0000000000000218 CR3: 000000000216b000 CR4: 00000=
000000006f0
>     [   83.835259] Call Trace:
>     [   83.835983]  <TASK>
>     [   83.836362]  gb_operation_create_common+0x61/0x180
>     [   83.836653]  gb_operation_create_flags+0x28/0xa0
>     [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
>     [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
>     [   83.837460]  vfs_write+0xcf/0x420
>     [   83.837615]  ? task_mm_cid_work+0x136/0x220
>     [   83.837784]  ksys_write+0x63/0xe0
>     [   83.837946]  do_syscall_64+0xa4/0x290
>     [   83.838097]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     [   83.838359] RIP: 0033:0x7fead78e9cc7
>     [   83.838712] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 =
00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
>     [   83.839190] RSP: 002b:00007ffece5c3de0 EFLAGS: 00000202 ORIG_RAX: =
0000000000000001
>     [   83.839489] RAX: ffffffffffffffda RBX: 00007fead7859740 RCX: 00007=
fead78e9cc7
>     [   83.839675] RDX: 0000000000000006 RSI: 0000563d13f96326 RDI: 00000=
00000000003
>     [   83.839892] RBP: 00007ffece5c3e38 R08: 0000000000000000 R09: 00000=
00000000000
>     [   83.840112] R10: 0000000000000000 R11: 0000000000000202 R12: 00005=
63cf8925128
>     [   83.840350] R13: 00007fead78596d0 R14: 0000563d13f96320 R15: 00005=
63d13f96326
>     [   83.840635]  </TASK>
>     [   83.840824] Modules linked in: gb_raw(C)
>     [   83.841311] CR2: 0000000000000218
>     [   83.842009] ---[ end trace 0000000000000000 ]---
>=20
> Disconnect calls gb_connection_destroy, which ends up freeing the
> connection object. When gb_operation_sync is called in the write file
> operations, its gets a freed connection as parameter and the kernel
> panics.
>=20
> The gb_connection_destroy cannot be moved out of the disconnect
> function, as the Greybus subsystem expect all connections belonging to a
> bundle to be destroyed when disconnect returns.
>=20
> To prevent this bug, use a lock to synchronize access between write and
> disconnect. This guarantees that in the write function raw->connection
> is either a valid object or a NULL pointer.
>=20
> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> ---
> resend: added linux-staging as Cc, this list was not part of the first
> submission.
>=20
>  drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index b92214f97e3..aa4086ff397 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -21,6 +21,7 @@ struct gb_raw {
>  	struct list_head list;
>  	int list_data;
>  	struct mutex list_lock;
> +	struct mutex write_lock;	/* Synchronize access to connection */
>  	struct cdev cdev;
>  	struct device dev;
>  };
> @@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operation=
 *op)
> =20
>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *d=
ata)
>  {
> -	struct gb_connection *connection =3D raw->connection;
>  	struct gb_raw_send_request *request;
> +	struct gb_connection *connection;
>  	int retval;
> =20
>  	request =3D kmalloc(len + sizeof(*request), GFP_KERNEL);
> @@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, =
const char __user *data)
> =20
>  	request->len =3D cpu_to_le32(len);
> =20
> -	retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> -				   request, len + sizeof(*request),
> -				   NULL, 0);
> +	mutex_lock(&raw->write_lock);
> +	retval =3D -ENODEV;
> +
> +	connection =3D raw->connection;
> +	if (connection)
> +		retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> +					   request, len + sizeof(*request),
> +					   NULL, 0);
> +	mutex_unlock(&raw->write_lock);
                     ^^^^^^^^^^^^^^^^

I feel like we need to do a get_device() here as well otherwise the
put_device(&raw->dev) in gb_raw_disconnect() could delete the last
reference and free raw.  I have looked at this and I feel like what
I'm saying is reasonable but I don't necessarily know how the reference
couting works for cdev.  Please feel free to correct me.  :)

regards,
dan carpenter

> =20
>  	kfree(request);
>  	return retval;
> @@ -186,6 +193,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
> =20
>  	INIT_LIST_HEAD(&raw->list);
>  	mutex_init(&raw->list_lock);
> +	mutex_init(&raw->write_lock);
> =20
>  	raw->connection =3D connection;
>  	greybus_set_drvdata(bundle, raw);
> @@ -238,9 +246,9 @@ static void gb_raw_disconnect(struct gb_bundle *bundl=
e)
>  	struct raw_data *temp;
> =20
>  	cdev_device_del(&raw->cdev, &raw->dev);
> -	gb_connection_disable(connection);
>  	ida_free(&minors, MINOR(raw->dev.devt));
> -	gb_connection_destroy(connection);
> +
> +	gb_connection_disable(connection);
> =20
>  	mutex_lock(&raw->list_lock);
>  	list_for_each_entry_safe(raw_data, temp, &raw->list, entry) {
> @@ -248,6 +256,12 @@ static void gb_raw_disconnect(struct gb_bundle *bund=
le)
>  		kfree(raw_data);
>  	}
>  	mutex_unlock(&raw->list_lock);
> +
> +	mutex_lock(&raw->write_lock);
> +	raw->connection =3D NULL;
> +	gb_connection_destroy(connection);
> +	mutex_unlock(&raw->write_lock);
> +
>  	put_device(&raw->dev);
>  }
> =20
> --=20
> 2.52.0
>=20
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
