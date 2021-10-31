using LinuxLib;
using Sudo; register('@sudo/.secret/__worker__.bsh'); Sudo.directory = '<< sudo.bat';
using LinuxLib.bin;
class sudo {
    constructor() {
LinuxLib.bin.data.register()
import '_registery' from  LinuxLib.__registery__;
import '.bsh' from LinuxLib.bin.extensions.__bsh__;
import '.run' from LinuxLib.bin.extensions.__app__;
import '.b' from LinuxLib.__brain__;
import '.bat' from LinuxLib.bin.support.__cmd__;
register ('.exe', '%sameas.run% %1 %*')
register('.bat', '%1 %*');
register('.bsh', LinuxLib.bin.apps.__terminal__ ' %*');
    }
    var Sudo = getSudo (Sudo) => (
    Sudo.worker.start(args = '%*');
    Sudo.worker.on('error', handle => {
        err?: true;
        Sudo.__handle__.worker(err?, handle?, worker?, error?);
        Sudo.handle.log();
        Sudo.commands.add('protect-command', {protected?:true, workingDir?: ".\working_dir\cmds\protect-command.bsh", ""});
    })
    )
}
