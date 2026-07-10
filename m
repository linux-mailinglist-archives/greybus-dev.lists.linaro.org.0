Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HY5pC44EVGrHgwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:06 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C7745EEC
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2EFD8404FD
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 21:18:04 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022103.outbound.protection.outlook.com [52.101.101.103])
	by lists.linaro.org (Postfix) with ESMTPS id 80E743F735
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 13:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/UKidZW2yROLKPKhG9FiE0erou4BUfd55Lpt15BZFxg3TnBGnPR22WFAO/P5qeCVZTzla5KVq7FF2+sjL6f/eVU9L8aCA+A9v13lM7J79ByPmXSV1PYBna1DtAaik2hyvjy4laCdRgbioUBXLC4Bsu2FYtS2jE/miouPSlyxPK+PWGvq/gh5oAy2LFEA/OyCKON1T89HSNizgicj4ayd1GVsKNL29AbgMGn+1pZmeJZWElXC7d3/pe/6Caasr/n9gIAbTycOxszYbJr8ToI/OPQ+pXCdVJAgoMz6QcAAWjkwqgACnT6Jgx7VIaRM0WWyH5Es/f/W462mD6eVXlvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dNuOHlrDEIkjKR9dIyVx0dXJKses962YAhpOz5OyCDA=;
 b=lphhwxzK+2YMMezx9gCXFikFc8fh60GNYaqcn/uEgPvULionwet/ks1XZC7WgoRlikuNW5mSEDb4KmGWpSwzIhMuODYrOIi6Xi3xBIfHxr4SdkXkiG5rN2rTw+K6NcA4NrXKAs4GCMeLI7tFU5m5cHu9uTxcYHS8WL0PcIEUUk0FkC8GQb+iqBYIqDjRoozdWdRSwDKF4ZwfA+s4scYNhGqfrTHkg41Ilg7LyYc8436wws/Pbl5yXn/QJafbHF6quEKi4CKj7OfdOKQWPXIq1gtW4Wy9LHOU5pUKhMsGhMSTui32I02vQ9zI7XwIroAjHT4OCrtT7okIPgJZm1C8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB6878.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 13:57:59 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 13:57:59 +0000
Date: Fri, 10 Jul 2026 09:57:55 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Message-ID: <xihlbspozbgwhez2byjatscslutapi3j4rjhpzxebtn2wjmk5a@qf62xs6lyd6q>
References: <20260708154510.6794-1-petr.pavlu@suse.com>
 <20260708154510.6794-3-petr.pavlu@suse.com>
Content-Disposition: inline
In-Reply-To: <20260708154510.6794-3-petr.pavlu@suse.com>
X-ClientProxiedBy: MN2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::30) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 8889c9a4-a311-464f-0f29-08dede8b401e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|56012099006|4143699003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	mnyvn741YVrPSaa0hwDbGrVtBRz+LIw95ja24e6zj7PbDMuYmcaDImgwK2HHFUGJbbEcU/o/lI/aj1VwebZpFhYjn4UNBPq0Wo0aBJiBiHe3jP82n7XKJZaaOP7aQSDCZkIHBBQoRitq/qc/ChGsRVhQZlLuO2WYFbdcf8mxHWu7lyFgatYFUByozN4BGDpucV3Z22SM6P1zRo1UfSTaESZ0Ck2YBy/WwQwcv7s6DVvTKZAUA4umAJCvnwKcMsWOIgi08wNl8E1PsoN2/mL8YDyYDnpKFa6J8iHkbsvfPLYe2jW/d9HrRHB6z62o53M9QTUxNAUefCfoiuWv9y1twRBkQvwlbble7/lJ+bawqZzE8wkMXVxr8aNr3u9oKAx0C9bxaVT8M6uKiA2rFfEScIE1kEubJz/zDxRHlnnN1Z2P+YER/lissTD9b+xKmRg/Sf8q5f8gDV5IQbo1LzG2awcxOlVf/+PlVTFLkqNRWBCpyhv8+9ohJ1AO+/UjiNB3LydrS89QDbi2A/4WcsSDaUxIIBrD5FuHSS2xZ90O6OvPaDYDeRdk4jD2z7K0DIogiyfS9zQitJX/zxK9aOCKHnmB+56lZ73lkP6/8l4ePv2jmJZnAppaQ4FxeFV4zYMyj/IYVUm0ykOl7VLAcDafxE8hRLZtvkgf9+Z4/XhYakQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjM4c0FxdHRFbVA2ZVNRdS80bFp5SDQxY3RQYjlGbTB1dDBzUG5zdEhFU2xK?=
 =?utf-8?B?KzFiM2M3a0QvNHptNUlwYzdNVWZIcWs4dlFteHVzSWczWWduUWNUejBmdEZm?=
 =?utf-8?B?aVNBdG1BcWpnd215UjYrb2J4TEc0cFFndzJVdURzdHJWV252bjNPdkh6Nnkx?=
 =?utf-8?B?ODVCN2pHanhmMzVKeXhMM3YyYXhZdExWQzJzdWl0YnhxcERtbUMvaFdvZm5x?=
 =?utf-8?B?aG0xdmk1cGRwNlNTRzJTajFMU1NzcityMERFQWJDL0NZdDhla09yaERpVlNq?=
 =?utf-8?B?UjhKbE1DdVdJZS9zMmZXMGQyNjkwK2dhZ2luUU13Z0J3eWowTUhEeTRqcFRq?=
 =?utf-8?B?elBCS0pTWlhvQWI5K3g0ckRHZU1CQkp0TGx6bk8yNUpWZmRIczB1b2hqYVQr?=
 =?utf-8?B?WkR5VnB4M2R2MGNwaFo5NkdlQUhVQXd5ZWEvYjVxc1l1dU9hUkcvZ29SOWpK?=
 =?utf-8?B?c0JrS0E1ZW1BVkNWNjdZYkZHNHljWW9lR3VHWENzcHY1empXbXNPb3ZwOG5I?=
 =?utf-8?B?aHRiN3JXQTNTQWNnZk1LS0N2RGVNOWMxOHhXWGRsUkxhK3REUG54M21lR0Jr?=
 =?utf-8?B?WjRra2JCeEVZRzhJNFlteExCZ0lacys2MUNXc0lDUnZ2cVVVT0JiMUpqWXJ2?=
 =?utf-8?B?VExGdTFVNHM2azlSek5WczR0SDdOVlZseGhmYmlJQmZ1M2plMFExeHhVRG4v?=
 =?utf-8?B?bytaWFdiSjdWL1dIbGpTNEkxL3FwWjRVdDRXZTBGNFlZNTUyNzJjSXFBNWlk?=
 =?utf-8?B?a3RvQS9GYTV2T0tzZ3h5RGZDcFplb0NHeXExOVl4M2IybkNVSktIbXJCMmM2?=
 =?utf-8?B?eU4vWDZrR29CcFlnZVdCd0tRV2J2TzBoeHBqbmtvTWdwZ3RndUl1ZUJ6Tk1q?=
 =?utf-8?B?ajVVRDIyRHNGTEJ5c3hsQ0N6aEdlaTk0VDZUZDBLeExBVDk3UTlzcmpHdVQr?=
 =?utf-8?B?cUhmdlNiTlhHUGRSUW96S1pGazVTbjBseTVCY0tqY1ViRjVkNEd6USs1WGUv?=
 =?utf-8?B?emhDcW5PTitrNGFCK3N4SG1vNXpCR2dwY212SVJYK3VjaTZEZUM5UzVUcjYv?=
 =?utf-8?B?TXp6bVRoU3BSdWVzaC8rQU95Nndubnd5eFUxQnFyb0JraWZxbTRkVWtLNmpL?=
 =?utf-8?B?VWRqMnhRRkRsVlJ5VWREeUNZWmFRbnFBMEk2VW9rSmpNem1hWisyTVplREIv?=
 =?utf-8?B?akFQbEhzVmt5ZjN5VC9wQThQV29uV1pqYlE4dVh5bE85SnRhQmRHbS9wMzdL?=
 =?utf-8?B?c1NzM1E4UU9iQWlaWUNGSkZUWWVwZDhTMmw2VWcxWjZOZmx5UnBmM3BGb2NW?=
 =?utf-8?B?ejRXR2FGVlFMR0lzQ3NOUFJCZUVlMmhIOGJweE5oSkhBRGx3b2ZOSXdnVnU5?=
 =?utf-8?B?ZEFPckdDcTJqNitIYkVjQTZ6VG90WGNUOGlNS3d3MGsrRktMd2V0Vk1qN0Fz?=
 =?utf-8?B?enovZGxLWWhYdEZMcCswcEtEODZHeWIzZFVPeE9qcWEraUpqR1U4TVd5Q3JE?=
 =?utf-8?B?OGJJUWdDaldocGhIb21FMURjQ2w4dUZYZ21RNmQzMkNWQkVJR0x2anF3RFJt?=
 =?utf-8?B?YVVlV01DaFpUVnBIZXA4SGZhdVVBbnFnVEtieWNQRERwZExPNzZpT1ZNQUFO?=
 =?utf-8?B?dFlyMEh4MEJKTjIzb2NreFFOMTB5MjVQSkpkYUdLekpLc0owbHJPN3RmaW5P?=
 =?utf-8?B?Y2poRGNsbmlWVGJwN3IxUXlZM3o3UDFQQVVIWkdVNitsZDJIaWlTWGliU3RB?=
 =?utf-8?B?VTZnbzNRK3IxMnM0ejFJMEwyM0F2TlhHRTVrOWJpUit5VWF4R2VSQmNMd0t0?=
 =?utf-8?B?Vm9LNStCbTRiYU9xMkdNYVMwR3dCcWx4QnhKMmorcDRYb2xSbkhpUFkxZldC?=
 =?utf-8?B?WEZmMTUxV1pNdHE5cTFUcFkveklZOW1CM1JWSHdFWGpxVUp3OFpvZ0pYVG4v?=
 =?utf-8?B?eWpkK20rb1BOUEZHUFdIUjJucHZ0cjQwNHZIMHRJaEZPbUlzRXE4OHV4STN3?=
 =?utf-8?B?a24zTWlLYnR5QzMyL3FnaWdpVWVmZldHNStkWjNkaUVHaWNidVNNM2tVK1Nx?=
 =?utf-8?B?cHVJMkNYbE5zOElrY24rSy92V1VlWTh3S2lVTWE5S1ZQQU50SzJmbVdsaThK?=
 =?utf-8?B?Q096SWdvQlRSNHMvZWpBSncyM2ZnUk1UU3BJNFZDY01kS00wOS9hNncxWHZH?=
 =?utf-8?B?amtYNmRidWJwVkNNangwdWNXWUxxUitDSjVwM3RaWHBOVkt5S2VHWUQ4cDU3?=
 =?utf-8?B?OGZ6OHhHRVFzaWE0dmdPMkZWNlZsN2ZFQklMcFhCRmdWc0pqM3djSjNPSEh6?=
 =?utf-8?B?eGpaS05KTWFBZ2xBZ2xuU3VWWHVyaVpteWI2UXByMW5EYlVXZ01LUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8889c9a4-a311-464f-0f29-08dede8b401e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 13:57:59.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDwfhxFpj9eN2nNEFrA5KAidckTs70TyYQaw5oNwhBSjWpXN0ngpfIvW4gAKhWaf72JIUvICyafxXZ+msFt7yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB6878
X-Spamd-Bar: ---
X-MailFrom: atomlin@atomlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OG6A3TDEODPIHM4VIYTTNS34JZ2ZDDTH
X-Message-ID-Hash: OG6A3TDEODPIHM4VIYTTNS34JZ2ZDDTH
X-Mailman-Approved-At: Sun, 12 Jul 2026 21:17:58 +0000
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Mark Fasheh <mark@fasheh.com>
 , Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-edac@vger.kernel
 .org, linux-kernel@vger.kernel.org, drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, cgroups@vger.kernel.org, linux-modules@vger.kernel.org, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bridge@lists.linux.dev, netdev@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] module: Bring includes in linux/kmod.h up to date
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OG6A3TDEODPIHM4VIYTTNS34JZ2ZDDTH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DATE_IN_PAST(1.00)[55];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DMARC_NA(0.00)[atomlin.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atomlin@atomlin.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:johan@kernel.org,m:elder@kernel.org,m:rafael@kernel.org,m:spock@gentoo.org,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:pavel@kernel.org,m:lenb@kernel.org,m:akpm@linux-foundation.org,m:dakr@kernel.org,m:razor@blackwall.org,m:idosch@nvidia.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redha
 t.com,m:horms@kernel.org,m:dhowells@redhat.com,m:jarkko@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:takedakn@nttdata.co.jp,m:penguin-kernel@i-love.sakura.ne.jp,m:linux-edac@vger.kernel,m:linux-kernel@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-block@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-acpi@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:bridge@lists.linux.dev,m:netdev@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atomlin@atomlin.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,linbit.com,kernel.dk,gentoo.org,gmx.de,zeniv.linux.org.uk,suse.cz,brown.name,oracle.com,talpey.com,fasheh.com,evilplan.org,linux.alibaba.com,cmpxchg.org,suse.com,google.com,linux-foundation.org,blackwall.org,nvidia.com,davemloft.net,paul-moore.com,namei.org,hallyn.com,nttdata.co.jp,i-love.sakura.ne.jp,vger.kernel,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.ozlabs.org,lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,atomlin.com:from_mime,atomlin.com:email,qf62xs6lyd6q:mid,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C7C7745EEC

On Wed, Jul 08, 2026 at 05:44:30PM +0200, Petr Pavlu wrote:
> Including linux/kmod.h alone results in 1.5 MB of preprocessed output, even
> though it provides only a few functions and macros.
> 
> The header currently depends on:
> 
> * __printf() -> linux/compiler_attributes.h,
> * ENOSYS -> linux/errno.h,
> * bool -> linux/types.h.
> 
> Include only these files, reducing the preprocessed output to 10 kB.
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  include/linux/kmod.h | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/kmod.h b/include/linux/kmod.h
> index 9a07c3215389..b9474a62a568 100644
> --- a/include/linux/kmod.h
> +++ b/include/linux/kmod.h
> @@ -2,17 +2,9 @@
>  #ifndef __LINUX_KMOD_H__
>  #define __LINUX_KMOD_H__
>  
> -/*
> - *	include/linux/kmod.h
> - */
> -
> -#include <linux/umh.h>
> -#include <linux/gfp.h>
> -#include <linux/stddef.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/errno.h>
> -#include <linux/compiler.h>
> -#include <linux/workqueue.h>
> -#include <linux/sysctl.h>
> +#include <linux/types.h>
>  
>  #ifdef CONFIG_MODULES
>  /* modprobe exit status on success, -ve on error.  Return value
> -- 
> 2.54.0
> 

LGTM. Thank you.

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
-- 
Aaron Tomlin
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
