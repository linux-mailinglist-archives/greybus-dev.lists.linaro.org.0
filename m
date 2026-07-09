Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yZHvFI+4T2otnQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 09 Jul 2026 17:04:47 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8D7329BF
	for <lists+greybus-dev@lfdr.de>; Thu, 09 Jul 2026 17:04:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=suse.com header.s=google header.b=PEYtBzSS;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=suse.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C59EF404A8
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2026 15:04:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 2291440470
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2026 09:49:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b77b150aso13078375e9.2
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2026 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783590589; x=1784195389; darn=lists.linaro.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXemn+RWgfgniHXL+Z+iccp115cwF5wMpUS4nNjdkFs=;
        b=PEYtBzSSlHZQZ6wa/6i5mTHd5Qb/nvFAEIPTZz6bUuuph/XqQ5ScY63khZjYm84D/J
         Fg5OrGc1FZC0FvyIfYDsSO7LaVlr/QlwLGek2/bcPOiyHVM8SzTbUImvpU9XRqS0PlGY
         VglgusFWAmBmJYZ0127+zv48L7er5HjJWPL8f+6kbBwEv+dn8XTjbI6WatgOcjZPaEos
         6LtExDRKfe/iVte6lnWgMmCMheZ++ExjKrCNWKNXkwhNLQjxHHiaUfapMPsi/7Zfcogh
         545zRWvkReNU94T6x8zF8ZWk94ktgUJACR2rFUJzmU0RJNfwYIX0sXf5pu9D86EqXsOb
         p7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590589; x=1784195389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXemn+RWgfgniHXL+Z+iccp115cwF5wMpUS4nNjdkFs=;
        b=CHQX/dhO+UtIxH/cbk6EAi4shoE1a4hx8hc/o5dkuD08wi6nowkANiVCVl3Cl6hxAU
         RUkW1fJ94/0w2RvSjckpxuI9qI4NNuYhHOmrV/BOhKSwTP8XFWs+DaCelsXBcRfJ93B8
         Gk7repQw1qXdTirqCOjaVp21byQOV986z5ufrhMU5qwaQwOxvfBdLD9eJvtVtc//uB9S
         UPSZKEKn7qbBxzMiLvZmFHjtMoR+4xGCLViD1m6fmJsSxfM1KtFcRLFBuR519lW8zo3d
         OZ7m/ZHj8Kv8uO99kvdWSuZNVJ+Q32V0p7qp5F0EFCtussBMqwtFUNKYKnMweEgMoYYJ
         OTow==
X-Forwarded-Encrypted: i=1; AHgh+Rps5XatvACmVJk3/AM5GVQkCi/i1OWGYJfGkEhRz5p7MMqLTpQ3NZWtNg7KfXmi5aQouDlq9igm2sC01w==@lists.linaro.org
X-Gm-Message-State: AOJu0YxnZV9VDIIm0EJJe/55vsYXwsrvQ+IEO4gHCjlyVmyrcwYlf8ZH
	lHst3PfGil/smAUFiztT5wSe2WgDvUPB0tqeTeBtJfsgszIQVnEs2xT+HMa5Q/YVwvQ=
X-Gm-Gg: AfdE7cklW1ax4KrKc7LZ3Qh/5yq8Csfrg8OM3kju4OfMckB6abXZZAtEYWuNwNkEZ8X
	sZwj37nlDpkOsbc8ihN+amDK7yQRAZzd8iTatGYLBeA+O458p+wBT6lrGoiL9gAZgg12+1h4z9p
	2DPtu92Bjf8ee4QQwj67sS4cGWYWqqIy65QsJUaakqFQqypRRavxmF4g3MDIwqfF2vg1SucLdXj
	60xR1W5c7Hz2s8yIXFT+DXpOlbUPX3maCN2OscUEK4+uBvg6l6RFBTVBCnRID5yp1wfW+affkNY
	PH7oHtkHpJpazgldpvN2mrcVsi0JHGes+QhceOYidVa2nWvYxDJetbXDiWXIWBkIvNaK4kuElMC
	BzKx6nr/zf8K1Mo4abahFrXfoJcVzXOU+6KIt/JuXFOzgBPQxukQkzxsxdDd3LKtmmMhh5F2yAx
	SWcDJhn9OLTexD/FFrS9fkrE0zfVzvV2R/mA==
X-Received: by 2002:a05:600c:c1d7:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-493e68c3535mr47652155e9.25.1783590588957;
        Thu, 09 Jul 2026 02:49:48 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm47837275e9.6.2026.07.09.02.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:49:48 -0700 (PDT)
Message-ID: <3e2ae6e8-41ad-45f0-a885-131a5711c276@suse.com>
Date: Thu, 9 Jul 2026 11:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
References: <20260708154510.6794-1-petr.pavlu@suse.com>
 <20260708154510.6794-2-petr.pavlu@suse.com>
 <ak6STbqZd-Q-c56v@localhost.localdomain>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <ak6STbqZd-Q-c56v@localhost.localdomain>
X-Spamd-Bar: ---
X-MailFrom: petr.pavlu@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VAIXHHDXYKGSU66N374OS7LZIV6HSGLH
X-Message-ID-Hash: VAIXHHDXYKGSU66N374OS7LZIV6HSGLH
X-Mailman-Approved-At: Thu, 09 Jul 2026 15:04:39 +0000
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Mark Fasheh <mark@fasheh.com>
 , Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-edac@vger.kernel.org, linux-ker
 nel@vger.kernel.org, drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, cgroups@vger.kernel.org, linux-modules@vger.kernel.org, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bridge@lists.linux.dev, netdev@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where needed
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VAIXHHDXYKGSU66N374OS7LZIV6HSGLH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[suse.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mkoutny@suse.com,m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:johan@kernel.org,m:elder@kernel.org,m:rafael@kernel.org,m:spock@gentoo.org,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:pavel@kernel.org,m:lenb@kernel.org,m:akpm@linux-foundation.org,m:dakr@kernel.org,m:razor@blackwall.org,m:idosch@nvidia.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redha
 t.com,m:horms@kernel.org,m:dhowells@redhat.com,m:jarkko@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:takedakn@nttdata.co.jp,m:penguin-kernel@i-love.sakura.ne.jp,m:linux-edac@vger.kernel.org,m:linux-ker nel@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-block@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-acpi@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:bridge@lists.linux.dev,m:netdev@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,linbit.com,kernel.dk,gentoo.org,gmx.de,zeniv.linux.org.uk,suse.cz,brown.name,oracle.com,talpey.com,fasheh.com,evilplan.org,linux.alibaba.com,cmpxchg.org,google.com,atomlin.com,linux-foundation.org,blackwall.org,nvidia.com,davemloft.net,paul-moore.com,namei.org,hallyn.com,nttdata.co.jp,i-love.sakura.ne.jp,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.ozlabs.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[suse.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1E8D7329BF

T24gNy84LzI2IDg6MTMgUE0sIE1pY2hhbCBLb3V0bsO9IHdyb3RlOg0KPiBIaSBQZXRyLg0KPiAN
Cj4gT24gV2VkLCBKdWwgMDgsIDIwMjYgYXQgMDU6NDQ6MjlQTSArMDIwMCwgUGV0ciBQYXZsdSA8
cGV0ci5wYXZsdUBzdXNlLmNvbT4gd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91
cC9jZ3JvdXAtdjEuYyBiL2tlcm5lbC9jZ3JvdXAvY2dyb3VwLXYxLmMNCj4+IGluZGV4IGE0MzM3
YzliNTI4Ny4uNjBlYjk5NGMzMmFlIDEwMDY0NA0KPj4gLS0tIGEva2VybmVsL2Nncm91cC9jZ3Jv
dXAtdjEuYw0KPj4gKysrIGIva2VybmVsL2Nncm91cC9jZ3JvdXAtdjEuYw0KPj4gQEAgLTE2LDYg
KzE2LDcgQEANCj4+ICAjaW5jbHVkZSA8bGludXgvcGlkX25hbWVzcGFjZS5oPg0KPj4gICNpbmNs
dWRlIDxsaW51eC9jZ3JvdXBzdGF0cy5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9mc19wYXJzZXIu
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgvdW1oLmg+DQo+PiAgDQo+PiAgI2luY2x1ZGUgPHRyYWNl
L2V2ZW50cy9jZ3JvdXAuaD4NCj4gDQo+IFRoZXJlIGlzIGttb2QuaCBpbiBoZXJlIHRvbyBidXQg
aXQncyB1bm5lY2Vzc2FyeSwgbm8gbW9kdWxlIGxhenkgbG9hZGluZw0KPiBpbiB0aGlzIGNvZGUu
DQoNCllvdSdyZSByaWdodC4gSSdsbCByZW1vdmUgdGhlIGttb2QuaCBpbmNsdWRlIGZyb20NCmtl
cm5lbC9jZ3JvdXAvY2dyb3VwLXYxLmMuIEkgd2VudCB0aHJvdWdoIGFsbCB0aGUgZmlsZXMgYWdh
aW4gYW5kIGl0DQpzZWVtcyB0aGlzIHdhcyB0aGUgb25seSBwbGFjZSBJIG1pc3NlZC4NCg0KLS0g
DQpUaGFua3MsDQpQZXRyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZl
QGxpc3RzLmxpbmFyby5vcmcK
