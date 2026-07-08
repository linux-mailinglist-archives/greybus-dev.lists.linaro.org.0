Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIOSMHKfTmq6QwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 08 Jul 2026 21:05:22 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE45729C70
	for <lists+greybus-dev@lfdr.de>; Wed, 08 Jul 2026 21:05:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=suse.com header.s=google header.b=L18FZGaI;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=suse.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82F9D40AD3
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Jul 2026 19:05:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id E72AB3F70E
	for <greybus-dev@lists.linaro.org>; Wed,  8 Jul 2026 18:13:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4720f3bf164so64215f8f.1
        for <greybus-dev@lists.linaro.org>; Wed, 08 Jul 2026 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783534407; x=1784139207; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEMJWE1zcwQ4UkLGDHzDIo1wA9TMgoKtQk475YCTe6o=;
        b=L18FZGaIFzNrjPIjavUelIRFE4SOPzfAzFTF9zFMM6gN4mzuYih/vYlofg+22FFnsh
         g3pQVykymnI80SewlLuN0eoOTZ5viq6FhIGKe9hjLEZmN/MUSfLvbOW0p9gTJHwl4A+X
         hXNyabx7p4aFs/PXP9cijWooaacYUh2apllNNiG6Fb5EZqOHPmWaH0kvGxelbeq7504s
         rq3Csj6jkA35f+rcYfSgaOb8a1PuJn+ozRMA85HkLp4s9MUyvT/AP8EV8dlRaxZ9Nz8s
         vWv7mhBCukHHchRtsGQPKU9xWTqINiSZ7vIvvwpVLPkH6q8ya0+QjR2bWMgN/YnNlSCM
         ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783534407; x=1784139207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEMJWE1zcwQ4UkLGDHzDIo1wA9TMgoKtQk475YCTe6o=;
        b=gBeP4sJpfI001MWRmVA2lT+Ub1mdQDEQsN6iWJebZ0N4gEQtj8NlruuPjzL9AIbihg
         IUPR4hA+MjpmBljOenGEMPHA2dxk737h9YP6RzFPx2xf1/QG+XcGuwz35QC1nd3o4iYQ
         pJd5UkZkGb50ME9exmrNiXKY4u4rUlwOI6h3KTmoz0ZsWG6r+yZTot0j8/7+N8V1BMEj
         C+ogcG+wo8trxD8m8v0/pxWao/6dXqH/XfaHmMHAnjmwmR4BkS/6lnIoOqlE6u/9pkIi
         p5xb0NbmcUBLyZbyjRzOkVSTttjjcltwnrVcZSUqanI5wZssl/SkQ+zKhzfdxaAyYmAp
         vXTw==
X-Forwarded-Encrypted: i=1; AHgh+RrUgjb7xQAHazf36YBvLb2SI92R0Qq33k1j4ezFbpyV+wL9/Q7yMvq+aWRhNS86DS2zPFS/xfcUpt4gnw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwBpig6/yr9CnShhJIpTJCOjMczo1zaR3dAukVv4LMcQFCPimcZ
	/AAdAWv/n/v6P94SZugUsM8oVzktXKpFTmgRcYpuSnC79u3RRRufNRMyxUf/Z2QZQjA=
X-Gm-Gg: AfdE7cnCfN1m4608Scei0v1h4Fes3Um8yMAXBycFc3h+zSOeKBsibZn+8zTomot+x7H
	NgelE/JoBrQPG4OaSlwFBfjcBX1tGjfhgFuUeuU+MvlAJYmQXBDrPYtzOUapzYkvJjuI6WsUcXl
	Qe4RjoRgx/wM8+0EsSOyj9fvBi2U0aD2RoRCGeST5jdUgeHZv+fTjXeNYHsCa5haeFaNjQgMmUf
	RHxzaQOkFOPuu6Iovzp5kwBecY3V6IG4unc1KpZfiZn+thr9Sbl01pSr3MD3vRe6Q+Cg9MVNrvO
	eBB7CPA2zJhE5w0wW2FC+d3pkGaL3Pvzjg1aHx92iplGbNdpwRZowPK+Xk5MlNHGyPsutW5qmZP
	imr5yKzqOTudRpYnOW634DO4ORdtbiL8Q7xlsA2QyULOxkLK6FWr46Wq8O2IeBrqQpI5lncB/3i
	9mK3vz1A7/Ipgw/J6yB5fq9O5QbOj/hNsPdv2H2w==
X-Received: by 2002:a05:6000:460c:b0:473:c608:eeb5 with SMTP id ffacd0b85a97d-47de9a4f159mr9196162f8f.29.1783534406837;
        Wed, 08 Jul 2026 11:13:26 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm43325516f8f.6.2026.07.08.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:13:26 -0700 (PDT)
Date: Wed, 8 Jul 2026 20:13:23 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Message-ID: <ak6STbqZd-Q-c56v@localhost.localdomain>
References: <20260708154510.6794-1-petr.pavlu@suse.com>
 <20260708154510.6794-2-petr.pavlu@suse.com>
MIME-Version: 1.0
In-Reply-To: <20260708154510.6794-2-petr.pavlu@suse.com>
X-Spamd-Bar: ------
X-MailFrom: mkoutny@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UJDOJORBCS72VBPHBNP72HNCIBERIZVN
X-Message-ID-Hash: UJDOJORBCS72VBPHBNP72HNCIBERIZVN
X-Mailman-Approved-At: Wed, 08 Jul 2026 19:04:59 +0000
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Mark Fasheh <mark@fasheh.com>
 , Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-edac@vger.kernel.org, linux-ker
 nel@vger.kernel.org, drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, cgroups@vger.kernel.org, linux-modules@vger.kernel.org, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bridge@lists.linux.dev, netdev@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where needed
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UJDOJORBCS72VBPHBNP72HNCIBERIZVN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7521769878948920171=="
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.11 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:johan@kernel.org,m:elder@kernel.org,m:rafael@kernel.org,m:spock@gentoo.org,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:pavel@kernel.org,m:lenb@kernel.org,m:akpm@linux-foundation.org,m:dakr@kernel.org,m:razor@blackwall.org,m:idosch@nvidia.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@re
 dhat.com,m:horms@kernel.org,m:dhowells@redhat.com,m:jarkko@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:takedakn@nttdata.co.jp,m:penguin-kernel@i-love.sakura.ne.jp,m:linux-edac@vger.kernel.org,m:linux-ker nel@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-block@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-acpi@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:bridge@lists.linux.dev,m:netdev@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,linbit.com,kernel.dk,gentoo.org,gmx.de,zeniv.linux.org.uk,suse.cz,brown.name,oracle.com,talpey.com,fasheh.com,evilplan.org,linux.alibaba.com,cmpxchg.org,google.com,atomlin.com,linux-foundation.org,blackwall.org,nvidia.com,davemloft.net,paul-moore.com,namei.org,hallyn.com,nttdata.co.jp,i-love.sakura.ne.jp,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.ozlabs.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mkoutny@suse.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[suse.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkoutny@suse.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BE45729C70


--===============7521769878948920171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kijzkd5xnaepafl2"
Content-Disposition: inline


--kijzkd5xnaepafl2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where
 needed
MIME-Version: 1.0

Hi Petr.

On Wed, Jul 08, 2026 at 05:44:29PM +0200, Petr Pavlu <petr.pavlu@suse.com> =
wrote:
> diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
> index a4337c9b5287..60eb994c32ae 100644
> --- a/kernel/cgroup/cgroup-v1.c
> +++ b/kernel/cgroup/cgroup-v1.c
> @@ -16,6 +16,7 @@
>  #include <linux/pid_namespace.h>
>  #include <linux/cgroupstats.h>
>  #include <linux/fs_parser.h>
> +#include <linux/umh.h>
> =20
>  #include <trace/events/cgroup.h>

There is kmod.h in here too but it's unnecessary, no module lazy loading
in this code.

Thanks,
Michal

--kijzkd5xnaepafl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCak6TOhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgY2gEAgOkCGIEUNQ8/AFfxYtdb
0XG1ZQXkD0d1Rm0cAq1+u8cBANw3nWI/wHkp5zcHmZWevxdnweU507gsyVTXzMGQ
ZwsB
=k+w6
-----END PGP SIGNATURE-----

--kijzkd5xnaepafl2--

--===============7521769878948920171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7521769878948920171==--
