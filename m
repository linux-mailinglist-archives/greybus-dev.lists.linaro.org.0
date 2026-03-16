Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9uKDHegTuGl/YwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 15:30:00 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D903329B64F
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 15:29:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E89393F683
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 14:29:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 8E5F0402BF
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 14:29:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=wZjl7yhj;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b3cfc38edso1981835f8f.3
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773671395; x=1774276195; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5O1swU8NmOTLqK1D+m8GT/l2uaibTB/blQwNEMTUaU=;
        b=wZjl7yhjMviHAX+Y0d85HIaA0/MQ79TC5vgQf7v/YD/GGYLUrx1pQtr+WqcqBLZuS9
         JD283N/jEYSOgZqTWGPnd1VuAfZOeMEG3fobgroAKAJ6OWOCPrnrFsYKgMz2X/Wu62DO
         fNNvvaLDeQNmkJDa+vDzcs9qkXgiFpcJS6jMMWrlf7i927+T7vsFNhQBtdmd59ZnS39T
         Vy4KvEfBQKMqCIg+9SnJT+bcV1pLEz6f7DOsKcQTyP5qJP1izRfTRe4Qgzle48/s6da8
         D++5LepoYzsCc6GxC3pXhY2WwJcY63LkpZNFrB1rfkhohXW90cnDo2Y3I9rbXppVxyVG
         VuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671395; x=1774276195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5O1swU8NmOTLqK1D+m8GT/l2uaibTB/blQwNEMTUaU=;
        b=beYaB+7Dj/3dScM0X6CyM4qdb1O0UJNLrzp7ShZuySyNy39ZX6zyCgkLO2t58u1R/Q
         zR+zh4xxIEqTkFcC0zI7sRMcbn9kvP2bB4fyqFmQlGRs+MQ5apsWA1SieIUhT+zm34bW
         kHZ3UNUBz3AULAqDseLvofKg8CZlCC8pGC/qLRushq/bAK7VrYjm+w8VufMVROWT71Tw
         4MG1OKZaM3f8FUkRoEUicw7mlzjeIgPFSz4fHSi/FGJqqGrEBP4/rVT2k82H9QX8OARY
         94ya2hH4F/VlxN2oT1Y46RTPVd215ToZdtvoXBYp/E8jAuBdiPcqFnlaTtFr4GV445wl
         hIuA==
X-Forwarded-Encrypted: i=1; AJvYcCVM0SYEFil3MMf7ZEeP6gE2aVNFvXWB2pgJtgKHOfyu320So2ZUoM8DybdKBZ8X8UcH1p2h17lzCbGTYw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yykm8ToHcwke9UqCPi6y+Ujz2UbvqAWfFMCyWjX+EWEpljICm5Z
	96jh6GDkNyom98rWA6DxAkKVfz084TT0HolEehQ9f/iGZv5oCFMpc22nAJIVrjOoNNPHqA==
X-Gm-Gg: ATEYQzz8etIVdW33mfROYi0pA1pjP1wYo42kxAi6xqsHHp+Utl714pJc6dsykT6qk+k
	uVhpaEbuzYrmBWnMxq28Kljzi55DAQTCCzPokvERDIvzRvCW7uD7WpoyJxdaWmJCHpTrs5J3rvM
	DbjOs/gsDs4VYVgaRwGk2LL7xsfNjVaZ/1qmlBvxd+MH87WfNYBofAKZOrPsD5F7y7FTDx3JeKu
	K53cKpqqBRuoQMlYB2+rbV5sro37GWWzO8xJNkD1l66Zm0XKPAp/Qfbay4SSR2FVaoT6XkM+LUN
	d0t+f2BTpVI6xn+rtzEcdfZBSQD9jjKhlwk2BwgPYXTcGPSyue3hxwZdYu7ihKYNL5FSMxUPlzx
	bxUw32tPWbEdD7rrnDdVRifUO0pnY7k0LSUk6fFyT1s+BMF/2YssCHjTz8Jayp58P+ZEjMgvEni
	aiLCtgEmiU/vXrRtzbdg8s+w7Icx1zjNRKl1JdlIk=
X-Received: by 2002:a05:600c:1d0f:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-485566d2fc4mr219241785e9.3.1773671395245;
        Mon, 16 Mar 2026 07:29:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm897879915e9.10.2026.03.16.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:29:54 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:29:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <abgT3zPdHZatrA1S@stanley.mountain>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
 <abezGG0LODIA4SZS@stanley.mountain>
 <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>
X-Spamd-Bar: ----
Message-ID-Hash: FMGHA6VR65QHTITNCW22NK3MWE27SEBU
X-Message-ID-Hash: FMGHA6VR65QHTITNCW22NK3MWE27SEBU
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FMGHA6VR65QHTITNCW22NK3MWE27SEBU/>
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
	NEURAL_SPAM(0.00)[0.936];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: D903329B64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 09:16:31AM -0400, Damien Ri=E9gel wrote:
> On Mon Mar 16, 2026 at 3:36 AM EDT, Dan Carpenter wrote:
> > On Wed, Mar 11, 2026 at 05:25:11PM -0400, Damien Ri=E9gel wrote:
> >> If a user writes to the chardev after disconnect has been called, the
> >> kernel panics with the following trace (with
> >> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy):
> >>
> >>     [   83.828726] BUG: kernel NULL pointer dereference, address: 0000=
000000000218
> >>     [   83.829288] #PF: supervisor read access in kernel mode
> >>     [   83.829528] #PF: error_code(0x0000) - not-present page
> >>     [   83.829828] PGD 0 P4D 0
> >>     [   83.830126] Oops: Oops: 0000 [#1] SMP NOPTI
> >>     [   83.830753] CPU: 0 UID: 0 PID: 140 Comm: raw_chardev_tes Tainte=
d: G         C          6.18.0-rc4 #212 PREEMPT(voluntary)
> >>     [   83.831260] Tainted: [C]=3DCRAP
> >>     [   83.831426] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
> >>     [   83.831912] RIP: 0010:gb_operation_message_alloc+0x14/0xc0
> >>     [   83.832366] Code: 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 0f 1f 44 00 00 41 56 4c 8d 72 08 41 55 41 89 cd1
> >>     [   83.832979] RSP: 0018:ffffb73f0027bd58 EFLAGS: 00010286
> >>     [   83.833247] RAX: ffffa44741f72300 RBX: ffffa44741f72300 RCX: 00=
00000000000cc0
> >>     [   83.833513] RDX: 000000000000000a RSI: 0000000000000002 RDI: 00=
00000000000000
> >>     [   83.833732] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 00=
00000000000000
> >>     [   83.834044] R10: ffffa44741f72300 R11: 0000000000000000 R12: 00=
00000000000002
> >>     [   83.834267] R13: 0000000000000cc0 R14: 0000000000000012 R15: 00=
00000000000000
> >>     [   83.834533] FS:  00007fead7859740(0000) GS:ffffa447a31bc000(000=
0) knlGS:0000000000000000
> >>     [   83.834776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>     [   83.834974] CR2: 0000000000000218 CR3: 000000000216b000 CR4: 00=
000000000006f0
> >>     [   83.835259] Call Trace:
> >>     [   83.835983]  <TASK>
> >>     [   83.836362]  gb_operation_create_common+0x61/0x180
> >>     [   83.836653]  gb_operation_create_flags+0x28/0xa0
> >>     [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
> >>     [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
> >>     [   83.837460]  vfs_write+0xcf/0x420
> >>     [   83.837615]  ? task_mm_cid_work+0x136/0x220
> >>     [   83.837784]  ksys_write+0x63/0xe0
> >>     [   83.837946]  do_syscall_64+0xa4/0x290
> >>     [   83.838097]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >>     [   83.838359] RIP: 0033:0x7fead78e9cc7
> >>     [   83.838712] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 =
00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
> >>     [   83.839190] RSP: 002b:00007ffece5c3de0 EFLAGS: 00000202 ORIG_RA=
X: 0000000000000001
> >>     [   83.839489] RAX: ffffffffffffffda RBX: 00007fead7859740 RCX: 00=
007fead78e9cc7
> >>     [   83.839675] RDX: 0000000000000006 RSI: 0000563d13f96326 RDI: 00=
00000000000003
> >>     [   83.839892] RBP: 00007ffece5c3e38 R08: 0000000000000000 R09: 00=
00000000000000
> >>     [   83.840112] R10: 0000000000000000 R11: 0000000000000202 R12: 00=
00563cf8925128
> >>     [   83.840350] R13: 00007fead78596d0 R14: 0000563d13f96320 R15: 00=
00563d13f96326
> >>     [   83.840635]  </TASK>
> >>     [   83.840824] Modules linked in: gb_raw(C)
> >>     [   83.841311] CR2: 0000000000000218
> >>     [   83.842009] ---[ end trace 0000000000000000 ]---
> >>
> >> Disconnect calls gb_connection_destroy, which ends up freeing the
> >> connection object. When gb_operation_sync is called in the write file
> >> operations, its gets a freed connection as parameter and the kernel
> >> panics.
> >>
> >> The gb_connection_destroy cannot be moved out of the disconnect
> >> function, as the Greybus subsystem expect all connections belonging to=
 a
> >> bundle to be destroyed when disconnect returns.
> >>
> >> To prevent this bug, use a lock to synchronize access between write and
> >> disconnect. This guarantees that in the write function raw->connection
> >> is either a valid object or a NULL pointer.
> >>
> >> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> >> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> >> ---
> >> resend: added linux-staging as Cc, this list was not part of the first
> >> submission.
> >>
> >>  drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
> >>  1 file changed, 20 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/r=
aw.c
> >> index b92214f97e3..aa4086ff397 100644
> >> --- a/drivers/staging/greybus/raw.c
> >> +++ b/drivers/staging/greybus/raw.c
> >> @@ -21,6 +21,7 @@ struct gb_raw {
> >>       struct list_head list;
> >>       int list_data;
> >>       struct mutex list_lock;
> >> +     struct mutex write_lock;        /* Synchronize access to connect=
ion */
> >>       struct cdev cdev;
> >>       struct device dev;
> >>  };
> >> @@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operat=
ion *op)
> >>
> >>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user=
 *data)
> >>  {
> >> -     struct gb_connection *connection =3D raw->connection;
> >>       struct gb_raw_send_request *request;
> >> +     struct gb_connection *connection;
> >>       int retval;
> >>
> >>       request =3D kmalloc(len + sizeof(*request), GFP_KERNEL);
> >> @@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 le=
n, const char __user *data)
> >>
> >>       request->len =3D cpu_to_le32(len);
> >>
> >> -     retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> >> -                                request, len + sizeof(*request),
> >> -                                NULL, 0);
> >> +     mutex_lock(&raw->write_lock);
> >> +     retval =3D -ENODEV;
> >> +
> >> +     connection =3D raw->connection;
> >> +     if (connection)
> >> +             retval =3D gb_operation_sync(connection, GB_RAW_TYPE_SEN=
D,
> >> +                                        request, len + sizeof(*reques=
t),
> >> +                                        NULL, 0);
> >> +     mutex_unlock(&raw->write_lock);
> >                      ^^^^^^^^^^^^^^^^
> >
> > I feel like we need to do a get_device() here as well otherwise the
> > put_device(&raw->dev) in gb_raw_disconnect() could delete the last
> > reference and free raw.  I have looked at this and I feel like what
> > I'm saying is reasonable but I don't necessarily know how the reference
> > couting works for cdev.  Please feel free to correct me.  :)
>=20
> This is not my understanding, nor what I could see when I tested this.
> With cdev_device_add(cdev, dev), dev becomes the parent of the chardev.
> So as long as the cdev is opened, dev cannot go away because its child
> holds a reference to it (it's done for us by device core logic, we don't
> have to take care of that or manually get_device()).
>=20
> If gb_raw_disconnect() is called while the device is opened, raw->dev
> won't be freed until the cdev is closed. When that happens, cdev's
> refcount drops to 0, which drops the reference to its parent, which can
> finally be freed.
>=20
> So I think the part you highlighted is fine as is. If you're fine with
> it, I'll just send a new version of the patchset with the first patch
> fixed (error path mishandled in probe function).

Yeah.  Thanks for the explanation.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
